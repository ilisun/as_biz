class OrdersController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: OrderDatatable.new(view_context) }
    end
  end

  def new
    @order = Order.new

    if (Order.count != 0 ) and (/\/\d{2}\//.match(Order.last.number).to_s == "/#{Date.today.strftime("%m")}/") then
      @order.number = "#{/\d+/.match(Order.last.number).to_s.to_i + 1}/#{Date.today.strftime("%m/%y")}"
    else
      @order.number = "1/#{Date.today.strftime("%m/%y")}"
    end
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
                                                          :total_sell_price, :location, :customer_paid, :_destroy])
  end

end
