class ProductDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def sortable_columns
    @sortable_columns ||= ['products.id']
  end

  def searchable_columns
    @searchable_columns ||= ['products.id']
  end

  private

  def data
    records.map do |record|
      [
          record.id,
          record.article,
          record.manufacturer,
          record.name,
          record.description,
          record.condition,
          record.status,
      ]
    end
  end

  def get_raw_records
    Product.all
  end

end
