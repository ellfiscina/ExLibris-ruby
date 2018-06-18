class AdminPanel::AdminsController < AdminPanelController
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to admin_panel_path, notice: "Adm criado com sucesso"
    else
      render :new
    end
  end

  def edit
    # Uses the before_action to set the admin.
  end

  def update
    if @admin.update(params_admin)
      redirect_to admin_panel_path, notice: "Adm atualizado com sucesso"
    else
      render :edit
    end
  end

  def destroy
    if @admin.destroy
      redirect_to admin_panel_path, notice: "Adm excluído com sucesso"
    else
      render :index
    end
  end

  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      if password_blank?
        params[:admin].delete(:password)
        params[:admin].delete(:password_confirmation)
      end

      params.require(:admin).permit(:email, :password, :password_confirmation)
    end

    def password_blank?
      params[:admin][:password].blank? &&
      params[:admin][:password_confirmation].blank?
    end
end
