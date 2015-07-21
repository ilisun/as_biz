class DeliveriesController < ApplicationController

  respond_to :html, :json

  def index
    respond_to do |format|
      format.html
      format.json { render json: DeliveryDatatable.new(view_context) }
    end
  end

  def show
    @delivery = Delivery.find(params[:id])
  end

  def import
    Delivery.import(params[:file])
    # TODO разобраться как правильно указать id для редиректа, пока сделано так
    @delivery = Delivery.maximum(:id)
    redirect_to delivery_path(@delivery)
  end

  def update
    @delivery = Delivery.find params[:id]
    @delivery.update_attributes(delivery_params)
    respond_with_bip(@delivery)
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:number, :doc_number, :doc_date, :total_pay, :take_at, :status)
  end

end
