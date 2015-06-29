class CarModificationsController < ApplicationController

  def import
    CarModification.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
