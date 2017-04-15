class User < ApplicationRecord
  has_many :pins
  has_secure_password
validates :email, uniqueness: true
validates :username, uniqueness: true
validates :password, length: { in: 6..20 }





end
