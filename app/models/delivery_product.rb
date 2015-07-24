class DeliveryProduct < ActiveRecord::Base
  belongs_to :delivery
  has_one :product

end
