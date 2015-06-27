class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.string  :number

      t.integer :create_by, null: false
      t.integer :update_by, null: false
      t.timestamps          null: false
    end
  end
end
