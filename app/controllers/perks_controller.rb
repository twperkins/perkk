class PerksController < ApplicationController
  def index
    @perks = Perk.order(name: :asc)
    # ^^^ we could order it instead by top rating, most upvotes or nearest distance?

    if params[:query].present?
      @perks = @perks.where('title ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'perks/list', locals: { perks: @perks }, formats: [:html] }
    end

    @all_perks = Perk.all
    @markers = @all_perks.geocoded.map do |perk|
      {
        lat: perk.latitude,
        lng: perk.longitude,
        info_window: render_to_string(partial: "info_window", locals: { perk: perk })
        # include perk logo as image_url
      }
    end
  end

  def show
    @perk = Perk.find(params[:id])
  end
end
