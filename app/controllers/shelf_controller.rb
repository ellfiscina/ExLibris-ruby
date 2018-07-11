class ShelfController < HomeController

  def read
    @books = current_user.books.per_status(1, params[:page])
  end

  def reading
    @books = current_user.books.per_status(2, params[:page])
  end

  def to_read
    @books = current_user.books.per_status(3, params[:page])
  end

  def own
    @books = current_user.books.per_shelf(1, params[:page])
  end

  def want
    @books = current_user.books.per_shelf(3, params[:page])
  end

  def title_book
    @book = @books.pluck(:title)
  end
end
