class Product < ApplicationRecord
  validates :description, :title, :img_url, :price, :category, presence: true
  validates :description, length: { minimum: 5 }
  validates :price, numericality: { greater_than: 0 }
  validates :category, inclusion: { in: %w(Toys Films Gadgets),
    message: "%{value} is not a valid category" }
end
