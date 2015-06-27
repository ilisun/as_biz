class Bank < ActiveRecord::Base

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path, extension: File.extname(file.original_filename))
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      t = Bank.new
      t.full_name = row['NAMEP']
      t.name = row['NAMEN']
      t.city = row['NNP']
      t.bik = row['NEWNUM']
      t.corr_account = row['KSNP']
      t.save
    end
  end

end
