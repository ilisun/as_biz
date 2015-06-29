class CarMark < ActiveRecord::Base

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path, extension: File.extname(file.original_filename))
    (1..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      t = CarMark.new
      t.id_car_mark = row[0].gsub(/'/, '')
      t.name = row[1].gsub(/'/, '')
      t.name_rus = row[2].gsub(/'/, '')
      t.save
    end
  end

end
