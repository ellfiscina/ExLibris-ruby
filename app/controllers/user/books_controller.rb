class User::BooksController < User::UserBaseController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books =  all_books.order(params[:sort]).per_page(params[:page])
    @count =  current_user.books.count
  end

  def show;end

  def new
    @book = Book.new
  end

  def edit;end

  def create
    @book = current_user.books.new(book_params)

      if @book.save
        redirect_to user_books_path, notice: t('messages.created_with', item: 'Livro')
      else
        render :new
      end
  end

  def update
      if @book.update(book_params)
        redirect_to user_book_path(@book), notice: t('messages.updated_with', item: 'Livro')
      else
        render :edit
      end
  end

  def destroy
    if @book.destroy
      redirect_to user_books_path, notice: t('messages.destroyed_with', item: 'Livro')
    else
      render :show
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def all_books
      Books::ByParamsQuery.call(current_user, params)
    end

    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit( :isbn, :title, :subtitle, :year, :pages,
                                    :edition, :language, :shelf, :status, :pages_read,
                                    :published, :editor_id, :author_id, :image )
    end

end
