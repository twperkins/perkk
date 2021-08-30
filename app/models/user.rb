class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable
  has_one_attached :profile_pic
  has_many :users_perks
  has_many :reviews
  belongs_to :company
  validates :email, :password, :name, :location, :tokens, :unique_code
  end
