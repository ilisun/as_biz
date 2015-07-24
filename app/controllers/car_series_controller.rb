class CarSeriesController < ApplicationController
  before_action :authenticate_user!

  def import
    CarSerie.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
