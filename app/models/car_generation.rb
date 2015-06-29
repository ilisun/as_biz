class CarGeneration < ActiveRecord::Base

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path, extension: File.extname(file.original_filename))
    (1..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      t = CarGeneration.new
      t.id_car_generation = row[0].gsub(/'/, '')
      t.name = row[1].gsub(/'/, '')
      t.id_car_model = row[2].gsub(/'/, '')
      t.year_begin = row[3].gsub(/'/, '')
      t.year_end = row[4].gsub(/'/, '')

      t.save
    end
  end

end
