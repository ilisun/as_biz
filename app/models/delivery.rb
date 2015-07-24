class Delivery < ActiveRecord::Base
  has_many :delivery_products, primary_key: :number, dependent: :destroy

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path, extension: File.extname(file.original_filename))

    row_start, row_end, row_price       = 0
    col_number, col_name, col_manuf     = 0
    col_article, col_amount, col_price  = 0
    number = '#' + n_generator(Delivery)

    delivery = Delivery.new
    delivery.number = number

    (1..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      (1..spreadsheet.last_column).each do |j|
        if row[j] == 'Номер документа'
          doc_number = spreadsheet.row(i+1)[j].to_s.split(".")
          delivery.doc_number = doc_number[0]
        elsif row[j] == 'Дата составления'
          delivery.doc_date = spreadsheet.row(i+1)[j]
        end
        if row[j] == 'Единица измерения' and row_start == 0
          row_start = i+3
        end
        if row[j] == 'Всего по накладной '
          row_price = i
        end
        if i == row_start-1
          if row[j].to_i    == 1
            col_number = j
          elsif row[j].to_i == 2
            col_name = j
          elsif row[j].to_i == 3
            col_manuf = j
          elsif row[j].to_i == 4
            col_article = j
          elsif row[j].to_i == 11
            col_amount = j
          elsif row[j].to_i == 16
            col_price = j
          end
        end
      end
    end

    delivery.total_pay = spreadsheet.row(row_price)[col_price]

    (row_start..row_price).each do |i|
      row = spreadsheet.row(i)
      if row[col_number].to_i > 1
        delivery_product = DeliveryProduct.new
          delivery_product.delivery_id  = number
          delivery_product.name         = row[col_name]
          delivery_product.manufacturer = row[col_manuf]
          article = row[col_article].to_s.split(".")
          delivery_product.article      = article[0]
          delivery_product.amount       = row[col_amount].to_i
          delivery_product.total_price  = row[col_price]
        delivery_product.save
      elsif i == row_start
        delivery_product = DeliveryProduct.new
          delivery_product.delivery_id  = number
          delivery_product.article      = row[col_article]
          delivery_product.name         = row[col_name]
          delivery_product.manufacturer = row[col_manuf]
          delivery_product.amount       = row[col_amount]
          delivery_product.total_price  = row[col_price]
        delivery_product.save
      end
    end
    delivery.save

  end

  # TODO надо убрать этот метод в application_helper но я не знаю как
  def self.n_generator(obj_data)
    if (obj_data.count != 0 ) and (/\/\d{2}\//.match(obj_data.last.number).to_s == "/#{Date.today.strftime("%m")}/") then
      number = "#{/\d+/.match(obj_data.last.number).to_s.to_i + 1}/#{Date.today.strftime("%m/%y")}"
    else
      number = "1/#{Date.today.strftime("%m/%y")}"
    end
  end

end
