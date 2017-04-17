class User < ApplicationRecord
  has_many :pins
  has_secure_password
require 'securerandom'
validates :email, uniqueness: true
validates :username, uniqueness: true
validates :password, length: { in: 6..24 }

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.password = SecureRandom.urlsafe_base64
        user.save!
      end
    end
end
