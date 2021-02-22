class Review < ApplicationRecord
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: (0..5) }
  belongs_to :cocktail
end
