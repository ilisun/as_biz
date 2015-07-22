class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name,    :string, limit: 32, null: false, default: ""
    add_column :users, :first_name,   :string, limit: 32, null: false, default: ""
    add_column :users, :middle_name,  :string, limit: 32
    add_column :users, :position,     :string, limit: 32
    add_column :users, :gender,       :string, limit: 16
    add_column :users, :birthday,     :date
    add_column :users, :phone,        :string, limit: 32
    add_column :users, :w_phone,      :string, limit: 32

  end
end
