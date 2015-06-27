class CreateAutos < ActiveRecord::Migration
  def change
    create_table :autos do |t|
      t.integer :client_id
      t.integer :type

      t.integer :create_by, null: false
      t.integer :update_by, null: false
      t.timestamps          null: false
    end
  end
end
