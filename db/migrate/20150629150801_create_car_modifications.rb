class CreateCarModifications < ActiveRecord::Migration
  def change
    create_table :car_modifications do |t|
      t.integer :id_car_modification
      t.integer :id_car_serie
      t.integer :id_car_model
      t.string  :name,               limit: 64,    null: false,  default: ""
      t.integer :start_production_year
      t.integer :end_production_year

      t.timestamps null: false
    end
  end
end
