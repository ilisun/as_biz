class DeliveryDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def_delegators :@view, :link_to, :delivery_path, :best_in_place

  def sortable_columns
    @sortable_columns ||= ['deliveries.number']
  end

  def searchable_columns
    @searchable_columns ||= ['deliveries.number']
  end

  private

  def data
    records.map do |record|
      [
          record.id,
          link_to(record.number, delivery_path(record)),
          best_in_place(record, :doc_number, as: :input),
          record.doc_date,
          record.total_pay,
          link_to('<i class="fa fa-trash-o"> </i>'.html_safe, delivery_path(record), method: :delete, data: { confirm: 'Вы уверены?' }),
      ]
    end
  end

  def get_raw_records
    Delivery.includes(:delivery_products).all
  end

end
