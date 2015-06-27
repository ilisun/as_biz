class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer   :category
      t.integer   :type_structure
      t.integer   :country_id
      t.integer   :city_id
      t.string    :service
      t.string    :attraction
      t.text      :comment

      t.integer   :create_by, null: false
      t.integer   :update_by, null: false
      t.timestamps  null: false
    end
  end
end
