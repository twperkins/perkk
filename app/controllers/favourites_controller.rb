class FavouritesController < ApplicationController

  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @perk = Perk.find(params[:perk_id])
    @favourite.perk = @perk
    if @favourite.save
      redirect_to request.referrer
    else
      redirect_to package_path
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to request.referrer
  end
end
