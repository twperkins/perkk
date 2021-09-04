class UsersController < ApplicationController
  before_action :overlay_calcs

  def profile
    @user = current_user
    @perks = Perk.all
    @recommended_perks = @perks.sample(3)

    @perk_category = @perks.map do |perk|
      perk.category
    end
    @perk_category.uniq!
  end

  def package
    @user_perk = UserPerk.new
    @user_perks_all = UserPerk.where(user: current_user)

    @owned_perks = @user_perks_all.map do |user_perk|
      user_perk.perk
    end

    @unowned_perks = []
    Perk.all.each do |perk|
      @unowned_perks << perk if @owned_perks.exclude?(perk) && @unowned_perks.exclude?(perk)
    end
  end

  private

  def overlay_calcs
    current_user_perks = current_user.perks
    token_array = current_user_perks.map do |perk|
      perk.token_cost
    end
    @total_tokens = token_array.sum
    @user_perks = current_user.perks.sort_by { |perk| perk.users.count }.reverse
    @tokens_left = current_user.tokens - @total_tokens
    @days_left = ((Date.today - current_user.company.subscription_end) / (1000 * 60 * 60 * 24))
    user_perks_calculator
  end

  def user_perks_calculator
    if current_user.perks.nil?
      @user_perks = Perks.first
    else
      @user_perks = current_user.perks.sort_by { |perk| perk.users.count }.reverse
    end
  end
end
