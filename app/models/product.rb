class Product < ApplicationRecord
  validates :description, presence: false,
                    length: { minimum: 5 }
end
