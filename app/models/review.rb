class Review < ApplicationRecord
  belongs_to :booking

  validates :description, presence: true
  validates :rating, presence: true
end
