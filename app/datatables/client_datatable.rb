class ClientDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  include AjaxDatatablesRails::Extensions::Kaminari
  # include AjaxDatatablesRails::Extensions::WillPaginate
  # include AjaxDatatablesRails::Extensions::SimplePaginator

  def_delegators :@view, :link_to, :edit_client_path, :client_path

  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
    @sortable_columns ||= ['clients.category']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.email'
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
        record.city.name,

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
