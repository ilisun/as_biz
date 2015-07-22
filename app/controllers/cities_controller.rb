class CitiesController < ApplicationController
  before_action :authenticate_user!

  authorize_resource

  def index
    @cities = City.all
  end

  def import
    City.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
