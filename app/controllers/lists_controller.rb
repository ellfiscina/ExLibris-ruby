class ListsController < HomeController
  before_action :set_list, only: [:show, :update, :destroy]

  # GET /lists
  def index
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  def show
    @books = @list.books.per_page(params[:page])
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    if @list.save!
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:year, book_ids: [])
    end
end
