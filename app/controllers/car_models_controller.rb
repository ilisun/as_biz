class CarModelsController < ApplicationController

  def import
    CarModel.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
