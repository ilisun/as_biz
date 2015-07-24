class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.integer :id_country
      t.string  :name,    limit: 32,    default: ""

      t.timestamps        null: false
    end
  end
end
