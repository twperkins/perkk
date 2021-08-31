class PerksController < ApplicationController

  before_action :set_perk, only: [:show, :edit, :update, :destroy, :chef]

  def show
  end

  private

  def perks_params
    params.require(:perk).permit(:name, :token_cost, :description, :perk_pic, :merchants)
  end

  def set_perk
    @perk = Perk.find(params[:id])
  end
end
