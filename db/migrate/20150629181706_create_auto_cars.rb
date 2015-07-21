class CreateAutoCars < ActiveRecord::Migration
  def change
    create_table :auto_cars do |t|
      t.integer   :auto_id
      t.integer   :car_mark_id
      t.integer   :car_model_id
      t.integer   :car_generation_id
      t.integer   :car_serie_id
      t.integer   :car_modification_id
      t.date      :year
      t.string    :vin,               limit: 32,    null: false,  default: ""
      t.string    :gos_number,        limit: 16,    null: false,  default: ""

      t.timestamps                    null: false
    end
  end
end
