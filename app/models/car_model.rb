class CarModel < ActiveRecord::Base

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path, extension: File.extname(file.original_filename))
    (1..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      t = CarModel.new
      t.id_car_model = row[0].gsub(/'/, '')
      t.id_car_mark = row[1].gsub(/'/, '')
      t.name = row[2].gsub(/'/, '')
      t.save
    end
  end

end
