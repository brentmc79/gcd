class User < ActiveRecord::Base

  attr_accessor :password, :password_confirmation

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password, confirmation: true

end
