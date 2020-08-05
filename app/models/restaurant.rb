class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :category, inclusion: {in: Restaurant::CATEGORIES, message: "not a valid entry"}
  validates :phone_number, presence: true
  validates :category, presence: true
  validates :address, presence: true
end
