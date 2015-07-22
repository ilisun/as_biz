class ProductsController < ApplicationController
  before_action :authenticate_user!

  authorize_resource

  def index
    respond_to do |format|
      format.html
      format.json { render json: ProductDatatable.new(view_context) }
    end
  end

end
