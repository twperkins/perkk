class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @perks = Perk.all
    @user = User.new
  end
end
