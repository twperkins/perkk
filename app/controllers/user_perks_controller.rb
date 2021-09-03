class UserPerksController < ApplicationController


  def create
    @perk = Perk.find(params[:perk_id])
    @user_perk = UserPerk.new
    @user_perk.perk_id = @perk.id
    if request.headers["Content-Type"] == "application/json"
      @user_perk.user = current_user
      if @user_perk.save
        render json: @user_perk
      else
        render json: {message: "failed to save"}
      end
    else
      @user_perk.user = current_user
      if @user_perk.save
        redirect_to package_path
        # redirect_to profile_path
      else
        redirect_to profile_path
      end
    end
  end

  def destroy
    if request.headers["Content-Type"] == "application/json"
      @user_perk = UserPerk.find(params[:id])
      p @user_perk
      @user_perk.destroy
      # @user_perk.user_id = params[:user_id]
      render json: {message: "user_perk deleted"}
    else
      # @user_perk = UserPerk.find(params[:id])
      # @user_perk.destroy
      # redirect_to package_path

    end
  end
end
