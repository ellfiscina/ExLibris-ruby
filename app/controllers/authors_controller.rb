class AuthorsController < HomeController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_column2, :sort_direction

  def index
    @authors = Author.all.order(sort_column + ' ' + sort_direction).per_page(params[:page])
    @count = Author.all.count
  end

  def new
    @author = Author.new
  end

  def edit;end

  def show
    @books = @author.books.order(sort_column2 + ' ' + sort_direction)
  end

  def create
    @author = Author.new(author_params)

      if @author.save
        redirect_to authors_path, notice: t('messages.created_with', item: 'Autor')
      else
        render :new
      end
  end

  def update
      if @author.update(author_params)
        redirect_to authors_path, notice: t('messages.updated_with', item: 'Autor')
      else
        render :edit
      end
  end

  def destroy
    if @author.destroy
      redirect_to authors_path, notice: t('messages.destroyed_with', item: 'Autor')
    else
      render :index
    end
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :surname)
    end

    def sort_column
      params[:sort] || "name"
    end

    def sort_column2
      params[:sort] || "title"
    end

    def sort_direction
      params[:direction] || "asc"
    end
end
