class BanksController < ApplicationController

  def index
    @banks = Bank.all

  end

  def import
    Bank.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

end
