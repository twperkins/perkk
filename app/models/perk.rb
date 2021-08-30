class Perk < ApplicationRecord
  has_many :users_perks
  has_many :reviews
  has_many_attached :perk_pic
  validates :name, :description, :location, :token_cost, :start_date, :end_date, :category, :merchants, presence: true
end
