class ApplicationController < ActionController::Base
  helper_method :lista

    def lista
      @list = List.all.order(:year)
    end
end
