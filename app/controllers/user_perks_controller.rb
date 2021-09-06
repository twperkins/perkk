class UserPerksController < ApplicationController
  def create
    @perk = Perk.find(params[:perk_id])
    @user_perk = UserPerk.new
    @user_perk.perk_id = @perk.id
    p "current user"
    if request.headers["Content-Type"] == "application/json"
      @user_perk.user = current_user
      if @user_perk.save
        render json: @user_perk
      else
        render json: { message: "failed to save" }
      end
      @total_perks = 0
      @user_perks = UserPerk.where(user: current_user)
      @user_perks.each { |user_perk| @total_perks += user_perk.perk.token_cost }
      current_user.tokens_used = @total_perks
      current_user.save(validate: false)
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
