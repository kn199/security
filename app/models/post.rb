class Post < ApplicationRecord
  INDEX_DISPLAY = 20

  belongs_to :user

  validates :title, uniqueness: true, length: { maximum: 100 }
  validates :description, uniqueness: true, length: { maximum: 300 }
end
