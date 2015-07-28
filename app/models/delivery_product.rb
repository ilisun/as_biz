class DeliveryProduct < ActiveRecord::Base
  belongs_to :delivery
  has_many   :products

end
