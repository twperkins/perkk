class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_pic
  has_many :user_perks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :perks, through: :user_perks
  has_many :orders, dependent: :destroy
  has_many :tokens, through: :orders
  belongs_to :company
  validates :email, :password, :name, :location, :token_allowance, :unique_code, presence: true
  validates :tokens_used, comparison: { less_than: :token_allowance }
end
