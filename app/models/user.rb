class User < ApplicationRecord
  has_secure_password
  validates :email, :password, :username, presence: true

  validates :username, uniqueness: {
    message: 'That username is already used by someone cooler than you because they got it first' }

  validates :email, uniqueness: { 
    message: 'We detect that this email already has an account' }
end