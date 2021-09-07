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
  has_many :orders
  has_many :tokens, through: :orders
  belongs_to :company
  validates :email, :password, :name, :location, :tokens, :unique_code, presence: true
end
