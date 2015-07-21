class ClientIndividual < ActiveRecord::Base
  belongs_to :client

  # validates :last_name, :first_name, presence: true

end
