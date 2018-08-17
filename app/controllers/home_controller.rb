class HomeController < ApplicationController
  layout 'home'

  def index
    if current_user
      redirect_to user_books_path
    else
      render :index
    end
    #@books = Book.all.per_page(params[:page])
  end
end
