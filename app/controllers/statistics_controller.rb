class StatisticsController < HomeController
  def index
    @books = current_user.books.all
    @list = List.count_books(:year)


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
  end

end
