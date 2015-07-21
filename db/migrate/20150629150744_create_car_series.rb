class CreateCarSeries < ActiveRecord::Migration
  def change
    create_table :car_series do |t|
      t.integer :id_car_serie
      t.integer :id_car_model
      t.string  :name,               limit: 64,    null: false,  default: ""
      t.integer :id_car_generation

      t.timestamps null: false
    end
  end
end
