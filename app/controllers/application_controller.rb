class ApplicationController < ActionController::Base
  helper_method :lista

    def lista
      @list = current_user.lists.order(:year)
    end
end
