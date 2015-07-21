class City < ActiveRecord::Base
  belongs_to :country
  has_many :clients

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path, extension: File.extname(file.original_filename))
    (1..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      t = City.new
      t.name = row[0].gsub(/'/, '')
      t.country_id = row[1].gsub(/'/, '')
      t.save
    end
  end

end
