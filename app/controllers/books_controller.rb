class BooksController < HomeController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = current_user.books.all.per_page(params[:page])
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.new(book_params)

      if @book.save
        redirect_to @book, notice: t('messages.created_with', item: 'Livro')
      else
        render :new
      end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
      if @book.update(book_params)
        redirect_to @book, notice: t('messages.updated_with', item: 'Livro')
      else
        render :edit
      end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
      redirect_to books_url, notice: t('messages.destroyed_with', item: 'Livro')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit( :isbn, :title, :subtitle, :year, :pages,
                                    :edition, :language, :shelf, :status,
                                    :published, :editor_id, :author_id, :image )
    end
end
