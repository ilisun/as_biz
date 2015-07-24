class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string  :name,      limit: 32,    default: ""
      t.integer :country_id

      t.timestamps          null: false
    end
  end
end
