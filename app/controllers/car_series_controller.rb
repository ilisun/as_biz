class CarSeriesController < ApplicationController

  def import
    CarSerie.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
