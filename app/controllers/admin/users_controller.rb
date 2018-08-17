class Admin::UsersController < Admin::AdminBaseController
  before_action :set_user, only: :show

  def index
    @users = User.all.order(:name).per_page(params[:page])
    @count = User.all.count
  end

  def show
    @books = @user.books.order(:title).per_page(params[:page])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
