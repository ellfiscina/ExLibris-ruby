class SearchController < HomeController
  def books
    @books = Book.search(params[:q], params[:page])
    @authors = Author.all
    @editors = Editor.all
  end
end
