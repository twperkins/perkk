class UserPerk < ApplicationRecord
  belongs_to :perk
  belongs_to :user
end
