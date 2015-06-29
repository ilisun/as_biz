class AutosController < ApplicationController

  def index
    @autos = Auto.all
  end

  def new
    @auto = Auto.new
    @auto.build_auto_car
  end

  def create
    params[:auto][:create_by] = current_user.id
    params[:auto][:update_by] = current_user.id
    @auto = Auto.new(auto_params)
    if @auto.save
      redirect_to autos_path
    else
      render :back
    end
  end

  def update
    @auto = Auto.find(params[:id])
    if @auto.update(auto_params)
      redirect_to @auto
    else
      render 'edit'
    end
  end

  def destroy
    @auto = Auto.find(params[:id])
    @auto.destroy
    redirect_to autos_path
  end

  private

  def client_params
    params.require(:auto).permit(:client_id, :type, :create_by, :update_by,
                                 :auto_car_attributes => [:mark, :model, :generation, :serie, :modification,
                                                          :year, :vin, :gos_number, :_destroy])
  end

end
