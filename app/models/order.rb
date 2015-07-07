class Order < ActiveRecord::Base
  belongs_to :client
  has_many :products, dependent: :destroy

  accepts_nested_attributes_for :products, allow_destroy: true, :reject_if => :all_blank
end
