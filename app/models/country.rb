class Country < ActiveRecord::Base
  has_many :cities
  has_many :clients

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path, extension: File.extname(file.original_filename))
    (1..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      t = Country.new
      t.id_country = row[0].gsub(/'/, '')
      t.name = row[1].gsub(/'/, '')
      t.save
    end
  end

end
