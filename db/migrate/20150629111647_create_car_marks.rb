class CreateCarMarks < ActiveRecord::Migration
  def change
    create_table :car_marks do |t|
      t.integer :id_car_mark
      t.string  :name
      t.string  :name_rus

      t.timestamps null: false
    end
  end
end
