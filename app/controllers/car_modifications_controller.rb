class CarModificationsController < ApplicationController
  before_action :authenticate_user!

  authorize_resource

  def import
    CarModification.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
