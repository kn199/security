class Profile < ApplicationRecord
  belongs_to :user

  validates :tel, uniqueness: true, length: { in: 10..15 }
  validates :address, length: { maximum: 100 }
end
