class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :comments, dependent: :destroy
  has_one :card, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :orders, dependent: :nullify

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PW_REGEX = /\A[a-z\d]{6,100}+\z/i 
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, confirmation: true, format: { with: VALID_PW_REGEX }, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
