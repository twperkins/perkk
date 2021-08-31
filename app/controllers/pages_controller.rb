class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @perks = Perk.all
  end
  def next
    @perk_main = Perk.next
  end
end
