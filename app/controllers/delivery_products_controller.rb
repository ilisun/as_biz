class DeliveryProductsController < ApplicationController

  def show
    @delivery_product = DeliveryProduct.find(params[:id])
  end

  def update
    @delivery_product = DeliveryProduct.find params[:id]
    @delivery_product.update_attributes(delivery_product_params)
    respond_with_bip(@delivery_product)
  end

  private

  def delivery_product_params
    params.require(:delivery_product).permit(:delivery_id, :article, :name, :manufacturer, :amount, :total_price)
  end

end
