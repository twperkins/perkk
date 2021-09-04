class PerksController < ApplicationController
  before_action :set_perk, only: [:show]
  before_action :overlay_calcs

  def index
    @perks = Perk.order(name: :asc)
    # ^^ we could order it instead by top rating, most upvotes or nearest distance?

    if params[:query].present?
      @perks = @perks.where('name ILIKE ? OR description ILIKE ? OR category ILIKE ? OR merchants ILIKE ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    @markers = @perks.geocoded.map do |perk|
      {
        lat: perk.latitude,
        lng: perk.longitude,
        info_window: render_to_string(partial: "info_window", locals: { perk: perk }, formats: [:html]),
        image_url: helpers.asset_url('p-mark.png')
        # image_url: perk.perk_pic.first.service_url
      }
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'perks/list', locals: { perks: @perks, markers: @markers }, formats: [:html] }
    end
  end

  def show
    @review = Review.new
    @users = @perk.users
  end

  private

  def set_perk
    @perk = Perk.find(params[:id])
  end

  def perks_params
    params.require(:perk).permit(:name, :token_cost, :description, :perk_pic, :merchants)
  end

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
