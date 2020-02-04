class User < ApplicationRecord
  validates :email, uniqueness: true

  has_many :tasks
  #encrypt password
  has_secure_password
end
