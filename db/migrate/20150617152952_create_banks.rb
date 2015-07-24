class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :full_name,          limit: 128,   default: ""
      t.string :name,               limit: 96,    default: ""
      t.string :city,               limit: 32,    default: ""
      t.string :bik,                limit: 16,    default: ""
      t.string :corr_account,       limit: 32,    default: ""

      t.timestamps null: false
    end
  end
end
