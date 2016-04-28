class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  has_many :items, through: :reviews
end
