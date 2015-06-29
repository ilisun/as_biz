class CreateAutoCars < ActiveRecord::Migration
  def change
    create_table :auto_cars do |t|
      t.integer   :auto_id
      t.string    :mark
      t.string    :model
      t.string    :generation
      t.string    :serie
      t.string    :modification
      t.date      :year
      t.string    :vin
      t.string    :gos_number

      t.timestamps null: false
    end
  end
end
