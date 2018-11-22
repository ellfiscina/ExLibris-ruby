class User::BooksController < User::UserBaseController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @sort = params[:sort]
    @books =  all_books.order(@sort).per_page(params[:page])
    @count = all_books.count
    @title = title(params)
    @partial = whitelisted_partial || 'grid'
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
    def all_books
      Books::ByParamsQuery.call(current_user, params)
    end

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      if params[:progress] == 'percentage'
        params[:book][:pages_read] = percent_to_pages(params[:book][:pages_read])
      end
      if params[:book][:pages_read] == @book.pages || params[:status].present?
        params[:book][:status] = 1
      end

      params.require(:book).permit( :isbn, :title, :subtitle, :year, :pages,
                                    :edition, :language, :shelf, :status, :pages_read,
                                    :published, :editor_id, :author_id, :image )
    end

    def title(params)
      if params[:status] == '1'
        title = 'Lido'
      elsif params[:status] == '2'
        title = 'Lendo'
      elsif params[:status] == '3'
        title = 'Fila de Leitura'
      elsif params[:shelf] == '1'
        title = 'Tenho'
      elsif params[:shelf] == '3'
        title = 'Desejo'
      elsif params[:query]
        title = params[:query]
      else
        title = 'Todos'
      end
    end

    def whitelisted_partial
      %w(grid list).detect { |str| str == params[:view] }
    end

    def percent_to_pages(percent)
      ((percent.to_i * @book.pages)/100).round()
    end
end
