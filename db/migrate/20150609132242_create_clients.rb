class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer   :category,        null: false,  default: 0
      t.integer   :type_structure,  null: false,  default: 0
      t.string    :name,            limit: 96,    null: false,  default: ""
      t.integer   :country_id,      null: false,  default: 1
      t.integer   :city_id,         null: false,  default: 450
      t.string    :service
      t.string    :attraction
      t.text      :comment

      t.integer   :create_by,       null: false
      t.integer   :update_by,       null: false
      t.timestamps                  null: false
    end
  end
end
