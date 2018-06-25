class ShelfController < HomeController

  def read
    @books = Book.per_status(1, params[:page])
    #title_book
  end

  def reading
    @books = Book.per_status(2, params[:page])
    title_book
  end

  def to_read
    @books = Book.per_status(3, params[:page])
    title_book
  end

  def own
    @books = Book.per_shelf(1, params[:page])
    title_book
  end

  def want
    @books = Book.per_shelf(3, params[:page])
    title_book
  end

  def title_book
    @book = @books.pluck(:title)
  end
end