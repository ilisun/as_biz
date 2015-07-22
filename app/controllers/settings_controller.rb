class SettingsController < ApplicationController
  before_action :authenticate_user!

  authorize_resource

  def set_auto
  end
  def set_bank
  end
  def set_city
  end
  def set_delivery
  end


end
