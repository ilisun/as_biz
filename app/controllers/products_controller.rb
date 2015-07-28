class ProductsController < ApplicationController
  before_action :authenticate_user!

  authorize_resource

  def compare
    @delivery = Delivery.find(params[:id])
    @delivery_products = DeliveryProduct.where(delivery_id: @delivery.number)
  end

  def update_compare
    puts "!!!!!!!!!!!!!!!!!!!!"
    puts params


    @products = Product.update(params[:products].keys, params[:products].values)
    if @products.empty?
      redirect_to deliveries_url
    else
      render "deliveries/index"
    end
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: ProductDatatable.new(view_context) }
    end
  end

end
