class ApplicationController < ActionController::Base

  helper_method :lista

  def lista
    @list = List.order_uniq(:year)
  end


end
