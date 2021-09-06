class FavouritesController < ApplicationController

  # def current_page?

  # end

  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @perk = Perk.find(params[:perk_id])
    @favourite.perk = @perk
    if @favourite.save
      # redirect_to package_path unless current_page?(controller: 'users', action: 'package')
    else
      redirect_to profile_path
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
  end
end