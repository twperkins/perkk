class Token < ApplicationRecord
  monetize :price_cents
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
end
