class AutosController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: AutoDatatable.new(view_context) }
    end
  end

  def new
    @auto = Auto.new
    @auto.build_auto_car
  end

  def edit
    @auto = Auto.find(params[:id])
  end

  def get_models
    mark = params[:id_car_mark]
    @models = CarModel.where(id_car_mark: mark)
  end

  def get_generations
    model = params[:id_car_model]
    @generations = CarGeneration.where(id_car_model: model)
  end

  def get_series
    generation = params[:id_car_generation]
    @series = CarSerie.where(id_car_generation: generation)
  end

  def get_modifications
    serie = params[:id_car_serie]
    @modifications = CarModification.where(id_car_serie: serie)
  end

  def get_clients
    name = params[:name]
    clients = Client.arel_table
    @clients = Client.where(clients[:name].matches("%#{name.to_s}%"))
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

  def auto_params
    params.require(:auto).permit(:client_id, :type_auto, :create_by, :update_by,
                                 :auto_car_attributes => [:car_mark_id, :car_model_id, :car_generation_id, :car_serie_id,
                                                          :car_modification_id, :year, :vin, :gos_number, :_destroy])
  end

end
