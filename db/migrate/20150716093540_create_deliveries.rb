class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string   :number
      t.string   :doc_number,   limit: 32,    null: false,  default: ""
      t.date     :doc_date
      t.decimal  :total_pay,    :precision => 8, :scale => 2,  default: 0.0
      t.date     :take_at
      t.string   :status

      t.timestamps              null: false
    end
  end
end
