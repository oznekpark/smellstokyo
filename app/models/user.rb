class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :comments, dependent: :destroy
  has_one :card, dependent: :destroy
  has_one :address, dependent: :destroy
end
