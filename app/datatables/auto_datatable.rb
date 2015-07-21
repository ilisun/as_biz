class AutoDatatable < AjaxDatatablesRails::Base

  include AjaxDatatablesRails::Extensions::Kaminari

  def_delegators :@view, :link_to, :edit_auto_path, :auto_path

  def sortable_columns
    @sortable_columns ||= ['autos.id','autos.type_auto', 'car_marks.name', 'car_models.name', 'auto_cars.year', 'auto_cars.gos_number']
  end

  def searchable_columns
    @searchable_columns ||= ['autos.id','autos.type_auto', 'car_marks.name', 'car_models.name', 'auto_cars.year', 'auto_cars.gos_number']
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        if record.type_auto == 0
          '<span class="tag label label-primary">Автомобиль</span>'.html_safe
        elsif record.type_auto == 1
          '<span class="tag label label-warning">Мотоцикл</span>'.html_safe
        end,
        record.auto_car.car_mark.name,
        record.auto_car.car_model.name,
        record.auto_car.year,
        record.auto_car.gos_number,
        link_to('<i class="fa fa-pencil"></i>'.html_safe, edit_auto_path(record)) + '&nbsp&nbsp'.html_safe +
            link_to('<i class="fa fa-trash-o"> </i>'.html_safe, auto_path(record), method: :delete, data: { confirm: 'Вы уверены?' }),
      ]
    end
  end

  def get_raw_records
    Auto.joins(auto_car: :car_mark).joins(auto_car: :car_model).all
  end

end
