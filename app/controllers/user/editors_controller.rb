class User::EditorsController < User::UserBaseController
  before_action :set_editor, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column,:sort_column2, :sort_direction

  def index
    @editors = Editor.all.order(sort_column + ' ' + sort_direction).per_page(params[:page])
    @count = Editor.all.count
  end

  def new
    @editor = Editor.new
  end

  def edit;end

  def show
    @books = @editor.books.order(sort_column2 + ' ' + sort_direction)
  end

  def create
    @editor = Editor.new(editor_params)
      if @editor.save
        redirect_to user_editors_path, notice: t('messages.created', item: 'Editora')
      else
        render :new
      end
  end

  def update
      if @editor.update(editor_params)
        redirect_to user_editors_path, notice: t('messages.updated', item: 'Editora')
      else
        render :edit
      end
  end

  def destroy
    if @editor.destroy
      redirect_to user_editors_path, notice: t('messages.updated', item: 'Editora')
    else
      render :index
    end
  end

  private
    def set_editor
      @editor = Editor.find(params[:id])
    end

    def editor_params
      params.require(:editor).permit(:name)
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
