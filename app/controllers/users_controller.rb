class UsersController < ApplicationController
  def profile
    @user = current_user
    @perks = Perk.all
    @recommended_perks = @perks.sample(2)
  end

  def package
    @all_perks = UserPerk.where(user:current_user)
    # @all_perks = current_user.user_perks
  end
end
