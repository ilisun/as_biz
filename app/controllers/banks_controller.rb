class BanksController < ApplicationController
  before_action :authenticate_user!

  authorize_resource

  def index
    @banks = Bank.all
  end

  def import
    Bank.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
