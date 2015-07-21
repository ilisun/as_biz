class CreateClientIndividualEntreps < ActiveRecord::Migration
  def change
    create_table :client_individual_entreps do |t|
      t.integer :client_id

      t.string  :cp_position,           limit: 64
      t.string  :cp_last_name,          limit: 32,    null: false,  default: ""
      t.string  :cp_first_name,         limit: 32,    null: false,  default: ""
      t.string  :cp_middle_name,        limit: 32,    null: false,  default: ""
      t.string  :cp_gender
      t.date    :cp_birthday
      t.string  :cp_phone,              limit: 32,    null: false,  default: ""
      t.string  :cp_alt_phone,          limit: 32
      t.string  :cp_fax,                limit: 32
      t.string  :cp_email,              limit: 32

      t.string  :li_company_name,       limit: 128,   null: false,  default: ""
      t.string  :li_inn,                limit: 16
      t.string  :li_ogrn,               limit: 16
      t.boolean :li_nds
      t.text    :li_legal_address
      t.text    :li_actual_address

      t.string  :bd_checking_account,   limit: 32
      t.string  :bd_bank_bik,           limit: 32

      t.string  :bc_position,           limit: 64
      t.string  :bc_last_name,          limit: 32
      t.string  :bc_first_name,         limit: 32
      t.string  :bc_middle_name,        limit: 32
      t.string  :bc_phone,              limit: 32
      t.string  :bc_email,              limit: 32

      t.timestamps                      null: false
    end
  end
end
