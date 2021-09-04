class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_one_attached :logo_pic
  validates :name, :total_token, :head_count, :subscription_end, :subscription_start, presence: true
  validates :name, uniqueness: true
end
