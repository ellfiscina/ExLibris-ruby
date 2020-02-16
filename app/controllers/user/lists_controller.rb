class User::ListsController < User::UserBaseController
  before_action :set_list, only: [:show, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /lists/new
  def new
    @list = current_user.lists.new
  end

  def show
    @books = @list.books.order(title: :asc).per_page(params[:page])
    @all_books = Book.all.sort_by{ |book| book.title }
  end

  # POST /lists
  def create
    @list = current_user.lists.new(list_params)
    if @list.save!
      redirect_to user_list_path(@list), notice: t('messages.created', item: 'Lista')
    else
      render :new
    end
  end

  def update
    @book = current_user.books.find(params["list"]["book_ids"])
    @list.books << @book
    if @list.update(list_params)
      redirect_to user_list_path(@list), notice: t('messages.inserted')
    else
      render :edit
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to user_books_path, notice: t('messages.destroyed', item: 'Lista')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = current_user.lists.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:year, book_ids: [])
    end

    def sort_column
      params[:sort] || "title"
    end

    def sort_direction
      params[:direction] || "asc"
    end
end
