class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :order_id
      t.string  :article
      t.string  :manufacturer
      t.string  :name
      t.string  :description
      t.string  :condition
      t.decimal :purchase_price
      t.decimal :selling_price
      t.integer :amount
      t.decimal :total_purch_price
      t.decimal :total_sell_price
      t.string  :location
      t.decimal :customer_paid

      t.timestamps        null: false
    end
  end
end
