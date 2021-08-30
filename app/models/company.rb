class Company < ApplicationRecord
  has_many :users
  has_one_attached :logo_pic
  validates :name, :total_token, :head_count, :subscription_start, :subscription_end, presence: true
  validates :name, uniqueness: true
end
