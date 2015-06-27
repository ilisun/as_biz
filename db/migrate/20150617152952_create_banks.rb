class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :full_name
      t.string :name
      t.string :city
      t.string :bik
      t.string :corr_account

      t.timestamps null: false
    end
  end
end
