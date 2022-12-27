class User < ApplicationRecord
  SQL_QUERY = "hoge' OR password LIKE '%%"

  has_many :posts

  validates :name, uniqueness: true, length: { maximum: 20 }
  validates :email, uniqueness: true, length: { maximum: 50 }
  validates :password, length: { maximum: 50 }
end
