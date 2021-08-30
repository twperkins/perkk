class Review < ApplicationRecord
  belongs_to :perk
  belongs_to :user
  validates :comment, presence: true, length: { minimum: 2 }
  validates :rating, presence: true
end
