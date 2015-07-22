class CarMarksController < ApplicationController
  before_action :authenticate_user!

  authorize_resource

  def index

  end

  def import
    CarMark.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end


end
