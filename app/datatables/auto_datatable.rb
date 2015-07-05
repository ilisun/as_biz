class AutoDatatable < AjaxDatatablesRails::Base

  include AjaxDatatablesRails::Extensions::Kaminari

  def_delegators :@view, :link_to, :edit_auto_path, :auto_path

  def sortable_columns
    @sortable_columns ||= ['autos.id','autos.type_auto']
  end

  def searchable_columns
    @searchable_columns ||= ['autos.id']
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        record.type_auto,
        record.auto_car.mark,
        record.auto_car.model,
        record.auto_car.year,
        record.auto_car.gos_number,
        link_to('<i class="fa fa-pencil"></i>'.html_safe, edit_auto_path(record)) + '&nbsp&nbsp'.html_safe +
            link_to('<i class="fa fa-trash-o"> </i>'.html_safe, auto_path(record), method: :delete, data: { confirm: 'Вы уверены?' }),
      ]
    end
  end

  def get_raw_records
    Auto.includes(:auto_car).all
  end

end
