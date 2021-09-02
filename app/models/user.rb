class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_pic
  has_many :user_perks
  has_many :perks, through: :user_perks
  belongs_to :company
  validates :email, :password, :name, :location, :tokens, :unique_code, presence: true
end
