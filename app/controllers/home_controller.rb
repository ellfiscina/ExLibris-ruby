class HomeController < ApplicationController
  before_action :authenticate_user!
  layout 'home'

  def index
    if current_user
      redirect_to books_path
    else
      render :index
    end
    #@books = Book.all.per_page(params[:page])
  end

private
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, notice: t('messages.login') if request.original_fullpath != root_path
    end
  end

end
