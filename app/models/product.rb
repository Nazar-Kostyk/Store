class Product < ApplicationRecord
  validates :text, presence: false,
                    length: { minimum: 5 }
end
