class StatisticsController < HomeController
  def index
    @books = Book.all
    @list = List.group(:year).count(:year)

    @total = current_user.books_count
    @big = Book.max_value(:pages)
    @small = Book.min_value(:pages)
    @old = Book.min_value(:year)
    @new = Book.max_value(:year)

    @big_title = Book.title_pages(@big)
    @small_title = Book.title_pages(@small)
    @old_title = Book.title_age(@old)
    @new_title = Book.title_age(@new)


    gon.read = current_user.books_count
    gon.reading = current_user.books_count
    gon.to_read = current_user.books_count
  end
end
