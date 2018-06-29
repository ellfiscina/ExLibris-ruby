class StatisticsController < HomeController
  def index
    @books = current_user.books.all
    @list = List.all.order(:year)

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
    gon.book = book_count()
  end

  private

  def book_count
    book = []
    List.all.each do |list|
        book.push(list.books.count)
    end
    return book
  end

  def year_count
    year = []
    List.all.each do |list|
        year.push(list.year)
    end
    return year
  end
end
