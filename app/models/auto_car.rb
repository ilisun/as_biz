class AutoCar < ActiveRecord::Base
  belongs_to :auto
  belongs_to :car_mark
  belongs_to :car_generation
  belongs_to :car_model
  belongs_to :car_modification
  belongs_to :car_serie

end
