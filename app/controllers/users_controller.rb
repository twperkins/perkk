class UsersController < ApplicationController
  def profile
    @user = current_user
    @perks = Perk.all
    @recommended_perks = @perks.sample(2)

    current_user_perks = current_user.perks
    token_array = current_user_perks.map do |perk|
      perk.token_cost
    end
    @total_tokens = token_array.sum
    @user_perks = current_user.perks.sort_by { |perk| perk.users.count }.reverse
  end

  def package
    @user_perk = UserPerk.new
    @user_perks = UserPerk.where(user:current_user)
    @perks = Perk.all #reject those that are already in user_perks
    # @all_perks = current_user.user_perks
  end
end
