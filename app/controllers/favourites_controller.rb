class FavouritesController < ApplicationController
  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @perk = Perk.find(params[:perk_id])
    @favourite.perk = @perk
    if @favourite.save
      redirect_to package_path
    else
      redirect_to profile_path
    end
  end
end
