class ClientDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def_delegators :@view, :link_to, :edit_client_path, :client_path

  def sortable_columns
    @sortable_columns ||= ['clients.category']
  end

  def searchable_columns
    @searchable_columns ||= ['clients.category']
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        link_to(record.name, client_path(record)),
        if record.type_structure == 0
          '<span class="tag label label-primary">Юр. лицо</span>'.html_safe
        elsif record.type_structure == 1
          '<span class="tag label label-warning">ИП</span>'.html_safe
        elsif record.type_structure == 2
          '<span class="tag label label-success">Физ. лицо</span>'.html_safe
        end,
        if record.category == 0
          '<span class="tag label label-success">Розница</span>'.html_safe
        elsif record.category == 1
          '<span class="tag label label-primary">Опт.</span>'.html_safe
        end,
        if record.city
          record.city.name
        end,
        link_to('<i class="fa fa-pencil"></i>'.html_safe, edit_client_path(record)) + '&nbsp&nbsp'.html_safe +
            link_to('<i class="fa fa-trash-o"> </i>'.html_safe, client_path(record), method: :delete, data: { confirm: 'Вы уверены?' }),
      ]
    end
  end

  def get_raw_records
    Client.includes(:client_entity, :client_individual_entrep, :client_individual, :city).all

    # Client.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
