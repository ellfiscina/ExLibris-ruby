class User::UserBaseController < ApplicationController
  before_action :authenticate_user!
  layout 'user'

private
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, notice: t('messages.login') if request.original_fullpath != root_path
    end
  end
end
