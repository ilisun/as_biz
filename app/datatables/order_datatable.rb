class OrderDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def_delegators :@view, :link_to, :edit_order_path, :order_path

  def sortable_columns
    @sortable_columns ||= ['orders.id']
  end

  def searchable_columns
    @searchable_columns ||= ['orders.id']
  end

  private

  def data
    records.map do |record|
      [
        record.id,
        link_to(record.number, order_path(record)),
        record.client.name,
        record.products.count,
        record.created_at.strftime("%d.%m.%y - %H:%M"),
        link_to('<i class="fa fa-pencil"></i>'.html_safe, edit_order_path(record)) + '&nbsp&nbsp'.html_safe +
            link_to('<i class="fa fa-trash-o"> </i>'.html_safe, order_path(record), method: :delete, data: { confirm: 'Вы уверены?' }),
      ]
    end
  end

  def get_raw_records
    Order.includes(:products, :client).all
  end

end
