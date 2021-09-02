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
    @all_perks = UserPerk.where(user:current_user)
    # @all_perks = current_user.user_perks
  end
end
