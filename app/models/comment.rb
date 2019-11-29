class Comment < ApplicationRecord
  validates :text, length: { minimum: 5 }
end
