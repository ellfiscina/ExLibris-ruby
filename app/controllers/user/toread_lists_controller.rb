class User::ToreadListsController < User::UserBaseController
  def index
    @books = current_user.books.where(status: 3)
  end
end
