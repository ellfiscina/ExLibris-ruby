class HomeController < ApplicationController
  def index
    @books = Book.all.per_page(params[:page])
  end

  def authors
    @authors = Author.all.order(:name)
  end

  def editors
    @editors = Editor.all.order(:name)
  end
end
