class ClientsController < ApplicationController
  def index
    @client = Client.all
  end

  def new
    @client = Client.new
    @client.build_client_entity
    @client.build_client_individual
    @client.build_client_individual_entrep
  end

  def get_banks
    bik = params[:bik]
    @banks = Bank.where(bik: bik)
  end

  def get_cities
    country = params[:country_id]
    @cities = City.where(country_id: country)
  end

  def edit

  end

  def create
    params[:client][:create_by] = current_user.id
    params[:client][:update_by] = current_user.id
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      render :back
    end
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end


  private

  def client_params
    params.require(:client).permit(:category, :type_structure, :country_id, :city_id, :service, :attraction, :comment, :create_by, :update_by,
                                   :client_entity_attributes => [:cp_position, :cp_last_name, :cp_first_name, :cp_middle_name,
                                                                 :cp_gender, :cp_birthday, :cp_phone, :cp_alt_phone, :cp_fax,
                                                                 :cp_email, :li_company_name, :li_inn, :li_kpp, :li_ogrn, :li_nds,
                                                                 :li_legal_address, :li_actual_address, :bd_checking_account, :bd_bank_bik,
                                                                 :dc_position, :dc_last_name, :dc_first_name, :dc_middle_name,
                                                                 :bc_position, :bc_last_name, :bc_first_name, :bc_middle_name,
                                                                 :bc_phone, :bc_email, :_destroy],
                                   :client_individual_entrep_attributes => [:cp_position, :cp_last_name, :cp_first_name, :cp_middle_name,
                                                                            :cp_gender, :cp_birthday, :cp_phone, :cp_alt_phone, :cp_fax,
                                                                            :cp_email, :li_company_name, :li_inn, :li_ogrn, :li_nds,
                                                                            :li_legal_address, :li_actual_address, :bd_checking_account, :bd_bank_bik,
                                                                            :dc_position, :dc_last_name, :dc_first_name, :dc_middle_name,
                                                                            :bc_position, :bc_last_name, :bc_first_name, :bc_middle_name,
                                                                            :bc_phone, :bc_email, :_destroy],
                                   :client_individual_attributes => [:last_name, :first_name, :middle_name, :gender, :birthday,
                                                                     :phone, :alt_phone, :fax, :email, :_destroy])
  end
end
