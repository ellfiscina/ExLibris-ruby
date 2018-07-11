class AuthorsController < HomeController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_column2, :sort_direction

  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.all.order(sort_column + ' ' + sort_direction).per_page(params[:page])
    @books = current_user.books
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  def show
    @books = @author.books.order(sort_column2 + ' ' + sort_direction)
  end
  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(author_params)

      if @author.save
        redirect_to authors_path, notice: t('messages.created_with', item: 'Autor')
      else
        render :new
      end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
      if @author.update(author_params)
        redirect_to authors_path, notice: t('messages.updated_with', item: 'Autor')
      else
        render :edit
      end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    if @author.destroy
      redirect_to authors_path, notice: t('messages.destroyed_with', item: 'Autor')
    else
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
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
