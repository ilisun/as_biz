class CountriesController < ApplicationController
  before_action :authenticate_user!

  authorize_resource

  def index
    @countries = Country.all
  end

  def import
    Country.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end


end
