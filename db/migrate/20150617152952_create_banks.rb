class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :full_name,          limit: 128,    null: false,  default: ""
      t.string :name,               limit: 96,    null: false,  default: ""
      t.string :city,               limit: 32,    null: false,  default: ""
      t.string :bik,                limit: 16,    null: false,  default: ""
      t.string :corr_account,       limit: 32,    null: false,  default: ""

      t.timestamps null: false
    end
  end
end
