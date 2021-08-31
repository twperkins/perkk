class Perk < ApplicationRecord
  has_many :users_perks
  has_many :reviews
  has_many_attached :perk_pic
  validates :name, :description, :location, :token_cost, :start_date, :end_date, :category, :merchants, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
