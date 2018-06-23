class ShelfController < HomeController

  def read
    @book = Book.sel_status(1)
    page_book
  end

  def reading
    @book = Book.sel_status(2)
    page_book
  end

  def to_read
    @book = Book.sel_status(3)
    page_book
  end

  def own
    @book = Book.sel_shelf(1)
    page_book
  end

  def want
    @book = Book.sel_shelf(2)
    page_book
  end

  def page_book
    @books = Kaminari.paginate_array(@book).page(params[:page])
    #@books = Book.per_page(params[:page])
  end
end
