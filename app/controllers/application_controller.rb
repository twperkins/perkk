class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(user)
    stored_location_for(user) || profile_path
  end
end
