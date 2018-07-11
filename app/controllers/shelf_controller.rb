class ShelfController < HomeController

  def read
    @books = current_user.books.per_status(1, params[:page])
    @count = current_user.books.where(status: 1).count
  end

  def reading
    @books = current_user.books.per_status(2, params[:page])
    @count = current_user.books.where(status: 2).count
  end

  def to_read
    @books = current_user.books.per_status(3, params[:page])
    @count = current_user.books.where(status: 3).count
  end

  def own
    @books = current_user.books.per_shelf(1, params[:page])
    @count = current_user.books.where(shelf: 1).count
  end

  def want
    @books = current_user.books.per_shelf(3, params[:page])
    @count = current_user.books.where(shelf: 3).count
  end
end
