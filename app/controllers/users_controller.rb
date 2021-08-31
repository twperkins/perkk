class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  def show
    @perk = Perk.find(params[:id])
  end
end
