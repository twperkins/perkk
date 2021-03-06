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
  has_many :user_tokens, dependent: :destroy
  has_many :tokens, through: :user_tokens

  belongs_to :company

  validates :email, :password, :name, :location, :token_allowance, :unique_code, :tokens_used, presence: true
  validates :tokens_used, numericality: { less_than: :token_allowance }
end
