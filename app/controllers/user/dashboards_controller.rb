class User::DashboardsController < User::UserBaseController
  def show
    @list = current_user.lists.order(:year)
    @max_min = max_min_hash

    gon.count = list_hash
    gon.shelf = shelf_hash
    gon.published = year_hash
  end

  private

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

  def year_hash
    h = Hash.new
    i = 0

    current_user.books.each do |book|
      h[i] = {
        year: book.published,
        title: book.title,
        link: book.author_id,
        author: book.author.name
      }
      i += 1
    end
    h
  end
end
