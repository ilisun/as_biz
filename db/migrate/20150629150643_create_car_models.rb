class CreateCarModels < ActiveRecord::Migration
  def change
    create_table :car_models do |t|
      t.integer :id_car_model
      t.integer :id_car_mark
      t.string  :name

      t.timestamps null: false
    end
  end
end
