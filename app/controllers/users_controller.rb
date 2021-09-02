class UsersController < ApplicationController
  def profile
    @user = current_user
    @perks = Perk.all
    @recommended_perks = @perks.sample(2)
    @perks_category = @perks.map do |perk|
      perk.category
    end
    @perks_category.uniq!
  end

  def package
    @user_perk = UserPerk.new
    @user_perks = UserPerk.where(user:current_user)
    @perks = Perk.all #reject those that are already in user_perks

    # @all_perks = current_user.user_perks
  end
end
