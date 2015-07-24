class CreateCarGenerations < ActiveRecord::Migration
  def change
    create_table :car_generations do |t|
      t.integer :id_car_generation
      t.string  :name,               limit: 64
      t.integer :id_car_model
      t.string  :year_begin
      t.string  :year_end

      t.timestamps null: false
    end
  end
end
