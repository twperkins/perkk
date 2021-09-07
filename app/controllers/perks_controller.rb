class PerksController < ApplicationController
  before_action :set_perk, only: [:show]
  before_action :overlay_calcs
  before_action :recommended_perks
  before_action :favourites

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
    @reviews = Review.where(perk: @perk)

    total_rating = 0
    @reviews.each do |review|
      total_rating += review.rating
    end
    @reviews.blank? ? @avg_rating = 0 : @avg_rating = (total_rating.to_f / @reviews.count).round(1)

    @perk_users = @perk.users.uniq
  end

  private

  def set_perk
    @perk = Perk.find(params[:id])
  end

  def perks_params
    params.require(:perk).permit(:name, :token_cost, :description, :perk_pic, :merchants)
  end

  def favourites
    @favourites = current_user.favourites.map do |favourite|
      favourite.perk
    end
  end

  def overlay_calcs
    current_user_perks = current_user.perks
    token_array = current_user_perks.map(&:token_cost)
    @total_tokens = token_array.sum
    @user_perks = current_user.perks.sort_by { |perk| perk.users.count }.reverse
    @tokens_left = current_user.token_allowance - @total_tokens
    @days_left = (current_user.company.subscription_end - Date.today).to_i
    @qr_code = RQRCode::QRCode.new(current_user.qr_code)
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: 8
    )
    user_perks_calculator
  end

  def user_perks_calculator
    if current_user.perks.nil?
      @user_perks = Perks.first
    else
      @user_perks = current_user.perks.sort_by { |perk| perk.users.count }.reverse
    end
  end

  def recommended_perks
    perks = Perk.all
    users = User.all
    owned_perks = UserPerk.where(user: current_user).map(&:perk)

    # counts how many perks in each category you have
    your_categories_total = Hash.new(0)
    current_user.perks.each do |perk|
      your_categories_total[perk.category] += 1
    end

    # counts how many perks are in each category
    categories_count = Hash.new(0)
    perks.each do |perk|
      categories_count[perk.category] += 1
    end

    # weights your categories depending on how many members they have
    your_categories = Hash.new(1)
    categories_count.each do |category, count|
      your_categories_total.each do |your_category, total|
        your_categories[your_category] = (total.to_f / count + 1).to_f if your_category == category
      end
    end

    # counts number of times each perk has been used
    perk_popularity = Hash.new(1)
    users.each do |user|
      user.perks.each do |perk|
        perk_popularity[perk] += 1
      end
    end

    # gets rating of each perk
    perk_rating = Hash.new(0)
    perks.each do |perk|
      count = 0
      total_rating = 0
      perk.reviews.each do |review|
        total_rating += review.rating
        count += 1
        perk_rating[perk] = (total_rating / count)
      end
    end

    # combine rating and popularity
    perk_weight = Hash.new(0)
    perk_popularity.each do |perk_pop, popularity|
      if perk_rating.include?(perk_pop)
        perk_rating.each do |perk_rat, rating|
          perk_weight[perk_rat] = (rating + 1) * popularity if perk_rat == perk_pop
        end
      else
        perk_weight[perk_pop] = popularity
      end
    end

    # add in category weighting
    perk_recommendations = Hash.new(0)
    perk_weight.each do |perk, weight|
      if your_categories.include?(perk)
        your_categories.each do |category, value|
          perk_recommendations[perk] = weight * value if perk.category == category
        end
      else
        perk_recommendations[perk] = weight
      end
    end

    # add in slight randomisation
    perk_slight_random = Hash.new(0)
    perk_recommendations.each do |perk, value|
      perk_slight_random[perk] = value * rand(1.0..3.0)
    end

    # get recommended into a nice array
    @all_recommended = (perk_slight_random.sort_by { |_k, v| -v }).map do |perk|
      perk[0]
    end

    # remove owned from recommended
    @recommended = @all_recommended - owned_perks
  end
end
