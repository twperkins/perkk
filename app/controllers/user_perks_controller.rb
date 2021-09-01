class UserPerksController < ApplicationController

  def create
    @perk = Perk.find(params[:perk_id])
    @user_perk = UserPerk.new
    @user_perk.perk_id = @perk.id
    @user_perk.user_id = current_user.id
    if @user_perk.save
            redirect_to package_path
# redirect_to profile_path
    else
      redirect_to package_path
    end
  end





end
