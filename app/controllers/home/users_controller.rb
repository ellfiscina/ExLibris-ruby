class Home::UsersController < HomeController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to home_path, notice: "User criado com sucesso"
    else
      render :new
    end
  end

  def edit
    # Uses the before_action to set the user.
  end

  def update
    if @user.update(params_user)
      redirect_to home_path, notice: "User atualizado com sucesso"
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path, notice: "User excluído com sucesso"
    else
      render :index
    end
  end

  private

    def set_user
      @user = user.find(params[:id])
    end

    def params_user
      if password_blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end

      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def password_blank?
      params[:user][:password].blank? &&
      params[:user][:password_confirmation].blank?
    end
end
