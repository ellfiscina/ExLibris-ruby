class EditorsController < HomeController
  before_action :set_editor, only: [:show, :edit, :update, :destroy]

  # GET /editors
  # GET /editors.json
  def index
    @editors = Editor.all.per_page(params[:page])
  end

  # GET /editors/new
  def new
    @editor = Editor.new
  end

  # GET /editors/1/edit
  def edit
  end

  def show
    @books = @editor.books
  end

  # POST /editors
  # POST /editors.json
  def create
    @editor = Editor.new(editor_params)
      if @editor.save
        redirect_to editors_path, notice: 'Editor was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /editors/1
  # PATCH/PUT /editors/1.json
  def update
      if @editor.update(editor_params)
        redirect_to editors_path, notice: 'Editor was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /editors/1
  # DELETE /editors/1.json
  def destroy
    @editor.destroy
      redirect_to editors_url, notice: 'Editor was successfully destroyed.'
      head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editor
      @editor = Editor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editor_params
      params.require(:editor).permit(:name)
    end
end
