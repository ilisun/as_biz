class Client < ActiveRecord::Base
  belongs_to :country
  belongs_to :city
  has_one :auto, dependent: :destroy
  has_one :order, dependent: :destroy
  has_one :client_entity, dependent: :destroy
  has_one :client_individual, dependent: :destroy
  has_one :client_individual_entrep, dependent: :destroy

  accepts_nested_attributes_for :client_entity, allow_destroy: true, :reject_if => :all_blank
  accepts_nested_attributes_for :client_individual, allow_destroy: true, :reject_if => :all_blank
  accepts_nested_attributes_for :client_individual_entrep, allow_destroy: true, :reject_if => :all_blank

end
