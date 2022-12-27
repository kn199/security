class User < ApplicationRecord
  has_many :posts
  has_one :profile

  validates :name, uniqueness: true, length: { maximum: 20 }
  validates :email, uniqueness: true, length: { maximum: 50 }
  validates :password, length: { maximum: 50 }
end
