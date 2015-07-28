class CreateDeliveryProducts < ActiveRecord::Migration
  def change
    create_table :delivery_products do |t|
      t.string   :delivery_id
      t.string   :article,      limit: 32,     null: false,  default: ""
      t.string   :name,         limit: 128,    null: false,  default: ""
      t.string   :manufacturer, limit: 128,    null: false,  default: ""
      t.integer  :amount
      t.decimal  :total_price,  :precision => 8, :scale => 2,  default: 0.0

      t.timestamps              null: false
    end
  end
end
