class HomeController < ApplicationController
  layout 'home'

  def index
    if current_user
      redirect_to books_path
    else
      render :index
    end
    #@books = Book.all.per_page(params[:page])
  end

  def authors
    @authors = Author.all.per_page(params[:page])
  end

  def editors
    @editors = Editor.all.per_page(params[:page])
  end
end
