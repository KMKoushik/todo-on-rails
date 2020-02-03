class User < ApplicationRecord
  validates :email, uniqueness: true

  #encrypt password
  has_secure_password
end
