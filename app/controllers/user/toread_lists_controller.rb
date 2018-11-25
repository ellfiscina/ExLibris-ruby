class User::ToreadListsController < User::UserBaseController
  before_action :position, only: :index

  def index
    @books = current_user.books.where(status: 3).order(:position)
  end

  def sort
    params['book'].values.each do |v|
      @book = current_user.books.find(v[:id].to_i)
      @book.update_attributes(position: v[:position])
    end
    redirect_to user_toread_lists_path
  end

  private

  def position
    books = current_user.books.where(status: 3)
    books.each_with_index do |book, index|
      if book.position.nil?
        book.position = index + 1
        book.save
      end
    end
  end

  def list_params
    params.require(:book).permit(:position)
  end
end
