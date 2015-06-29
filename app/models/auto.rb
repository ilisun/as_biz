class Auto < ActiveRecord::Base
  belongs_to :client
  has_one :auto_car, dependent: :destroy

  accepts_nested_attributes_for :auto_car, allow_destroy: true, :reject_if => :all_blank
end
