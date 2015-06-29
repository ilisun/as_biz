class CarSerie < ActiveRecord::Base

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path, extension: File.extname(file.original_filename))
    (1..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      t = CarSerie.new
      t.id_car_serie = row[0].gsub(/'/, '')
      t.id_car_model = row[1].gsub(/'/, '')
      t.name = row[2].gsub(/'/, '')
      t.id_car_generation = row[3].gsub(/'/, '')

      t.save
    end
  end

end
