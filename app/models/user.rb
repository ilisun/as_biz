class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

  devise :timeoutable, :timeout_in => 30.minutes

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
