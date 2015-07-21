class CreateClientIndividuals < ActiveRecord::Migration
  def change
    create_table :client_individuals do |t|
      t.integer :client_id

      t.string  :last_name,           limit: 32,    null: false,  default: ""
      t.string  :first_name,          limit: 32,    null: false,  default: ""
      t.string  :middle_name,         limit: 32,    null: false,  default: ""
      t.string  :gender
      t.date    :birthday
      t.string  :phone,               limit: 32,    null: false,  default: ""
      t.string  :alt_phone,           limit: 32
      t.string  :fax,                 limit: 32
      t.string  :email,               limit: 32

      t.timestamps                    null: false
    end
  end
end
