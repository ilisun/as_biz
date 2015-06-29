class CarModification < ActiveRecord::Base

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path, extension: File.extname(file.original_filename))
    (1..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      t = CarModification.new
      t.id_car_modification = row[0].gsub(/'/, '')
      t.id_car_serie = row[1].gsub(/'/, '')
      t.id_car_model = row[2].gsub(/'/, '')
      t.name = row[3].gsub(/'/, '')
      t.start_production_year = row[4].gsub(/'/, '')
      t.end_production_year = row[5].gsub(/'/, '')

      t.save
    end
  end

end
