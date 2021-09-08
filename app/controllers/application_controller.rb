class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def default_url_options
  { host: ENV["http://www.perkk.co.uk"] || "localhost:3000" }
  end

  def authenticate_user!
    return unless user_signed_in? == false

    redirect_to root_path(logged_in: false), notice: 'You need to sign in before continuing.'
  end

  def after_sign_in_path_for(user)
    stored_location_for(user) || profile_path
  end
end
