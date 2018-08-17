class User::DashboardsController < User::UserBaseController
  def show
    @list = current_user.lists.order(:year)
    @max_min = max_min_hash
    @list_count = list_hash

    gon.count = @list_count
    gon.shelf = shelf_hash
  end

  private

  def book_count
    book = []
    current_user.lists.each do |list|
      book.push(list.books.count)
    end
    return book
  end

  def year_count
    year = []
    current_user.lists.each do |list|
      year.push(list.year)
    end
    return year
  end

  def pages_count
    pages = []
    current_user.lists.each do |list|
      pages.push(list.books.sum(:pages))
    end
    return pages
  end

  def count_query(params)
    Books::CountQuery.call(current_user, params)
  end

  def pluck_query(params)
    Books::MinMaxQuery.call(current_user, params)
  end

  def max_min_hash
    h = Hash.new

    h[:big] = pluck_query(type: 'max', attr: :pages)
    h[:small] = pluck_query(type: 'min', attr: :pages)
    h[:old] = pluck_query(type: 'min', attr: :published)
    h[:new] = pluck_query(type: 'max', attr: :published)

    h
  end

  def list_hash
    h = Hash.new

    current_user.lists.each do |list|
      year = list.year
      h[year] = {
        books: list.books.count,
        pages: list.books.sum(:pages)
      }
    end

    h
  end

  def shelf_hash
    h = Hash.new

    h['read'] = count_query(status: 1)
    h['reading'] = count_query(status: 2)
    h['to_read'] = count_query(status: 3)

    h
  end
end
