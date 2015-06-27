class CreateClientIndividuals < ActiveRecord::Migration
  def change
    create_table :client_individuals do |t|
      t.integer :client_id

      t.string  :last_name
      t.string  :first_name
      t.string  :middle_name
      t.string  :gender
      t.date    :birthday
      t.string  :phone
      t.string  :alt_phone
      t.string  :fax
      t.string  :email

      t.timestamps          null: false
    end
  end
end
