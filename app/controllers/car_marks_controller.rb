class CarMarksController < ApplicationController

  def index

  end

  def import
    CarMark.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end


end
