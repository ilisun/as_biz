class CarGenerationsController < ApplicationController
  before_action :authenticate_user!

  authorize_resource

  def import
    CarGeneration.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
