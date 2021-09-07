class Token < ApplicationRecord
  monetize :price_cents
  has_many :orders
  has_many :users, through: :orders
end
