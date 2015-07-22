class OrdersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  authorize_resource

  def index
    respond_to do |format|
      format.html
      format.json { render json: OrderDatatable.new(view_context) }
    end
  end

  def new
    @order = Order.new
    @order.number = number_generator(Order)
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    params[:order][:create_by] = current_user.id
    params[:order][:update_by] = current_user.id
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :back
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:client_id, :number, :create_by, :update_by,
                                 :products_attributes => [:article, :manufacturer, :name, :description, :condition,
                                                          :purchase_price, :selling_price, :amount, :total_purch_price,
                                                          :total_sell_price, :location, :customer_paid, :paid_at, :_destroy])
  end

end
