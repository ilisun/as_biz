class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer   :order_id
      t.string    :delivery_product_id
      t.string    :article,           limit: 32,    null: false,  default: ""
      t.string    :manufacturer,      limit: 32
      t.string    :name,              limit: 128
      t.string    :description,       limit: 128
      t.string    :condition # состояние детали [новая, б/у]
      t.decimal   :purchase_price,    :precision => 8, :scale => 2,  default: 0.0
      t.decimal   :selling_price,     :precision => 8, :scale => 2,  default: 0.0
      t.integer   :amount,            null: false,  default: 1
      t.decimal   :total_purch_price, :precision => 8, :scale => 2,  default: 0.0
      t.decimal   :total_sell_price,  :precision => 8, :scale => 2,  default: 0.0
      t.string    :status # статус детали [в обработке, заказана у поставщика, отправлена к нам, отправлена клиенту, доставлена клиенту]
      t.decimal   :customer_paid,     :precision => 8, :scale => 2,  default: 0.0
      t.date      :paid_at

      t.timestamps                    null: false
    end
  end
end
