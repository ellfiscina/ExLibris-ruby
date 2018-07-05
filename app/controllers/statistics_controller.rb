class StatisticsController < HomeController
  def index
    @books = current_user.books.all
    @list = current_user.lists.order(:year)

    @total = current_user.books_count
    @big = @books.max_value(:pages)
    @small = @books.min_value(:pages)
    @old = @books.min_value(:year)
    @new = @books.max_value(:year)

    @big_title = @books.title_pages(@big)
    @small_title = @books.title_pages(@small)
    @old_title = @books.title_age(@old)
    @new_title = @books.title_age(@new)

    gon.read = @books.count_status(1)
    gon.reading = @books.count_status(2)
    gon.to_read = @books.count_status(3)
    gon.year = year_count()
    gon.books = book_count()
    gon.pages = pages_count()
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
end
