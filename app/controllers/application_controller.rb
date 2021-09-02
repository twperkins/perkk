class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_user!
    if user_signed_in?
      redirect_to profile_path, notice: 'Signed in'
    else
      redirect_to root_path, notice: 'You need to sign in before continuing.'
      # respond_to do |format|
      #   format.js { render js: "toggleLogin();" }
      # end
    end
  end

  def after_sign_in_path_for(user)
    stored_location_for(user) || profile_path
  end
end
