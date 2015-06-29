class CarGenerationsController < ApplicationController

  def import
    CarGeneration.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
