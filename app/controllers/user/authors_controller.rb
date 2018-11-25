class User::AuthorsController < User::UserBaseController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @authors = all_authors.order(sort_column("name") + ' ' + sort_direction).per_page(params[:page])
    @count = Author.all.count
  end

  def new
    @author = Author.new
  end

  def edit; end

  def show
    @books = @author.books.order(sort_column("title") + ' ' + sort_direction)
  end

  def create
    @author = Author.new(author_params)

      if @author.save
        redirect_to user_authors_path, notice: t('messages.created_with', item: 'Autor')
      else
        render :new
      end
  end

  def update
      if @author.update(author_params)
        redirect_to user_authors_path, notice: t('messages.updated_with', item: 'Autor')
      else
        render :edit
      end
  end

  def destroy
    if @author.destroy
      redirect_to user_authors_path, notice: t('messages.destroyed_with', item: 'Autor')
    else
      render :index
    end
  end

  private
    def all_authors
      Authors::ByParamsQuery.call(params)
    end

    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :surname)
    end

    def sort_column(string=nil)
      params[:sort] || string
    end

    def sort_direction
      params[:direction] || "asc"
    end
end
