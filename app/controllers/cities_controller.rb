class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def import
    City.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
