class CreateClientEntities < ActiveRecord::Migration
  def change
    create_table :client_entities do |t|
      t.integer :client_id

      t.string  :cp_position
      t.string  :cp_last_name
      t.string  :cp_first_name
      t.string  :cp_middle_name
      t.string  :cp_gender
      t.date    :cp_birthday
      t.string  :cp_phone
      t.string  :cp_alt_phone
      t.string  :cp_fax
      t.string  :cp_email

      t.string  :li_company_name
      t.string  :li_inn
      t.string  :li_kpp
      t.string  :li_ogrn
      t.boolean :li_nds
      t.text    :li_legal_address
      t.text    :li_actual_address

      t.string  :bd_checking_account
      t.string  :bd_bank_bik

      t.string  :dc_position
      t.string  :dc_last_name
      t.string  :dc_first_name
      t.string  :dc_middle_name

      t.string  :bc_position
      t.string  :bc_last_name
      t.string  :bc_first_name
      t.string  :bc_middle_name
      t.string  :bc_phone
      t.string  :bc_email

      t.timestamps          null: false
    end
  end
end
