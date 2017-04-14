class User < ApplicationRecord
validates :email, uniqueness: true
validates :username, uniqueness: true
validates :password, length: { in: 6..20 }


end
