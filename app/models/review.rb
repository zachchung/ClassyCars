class Review < ApplicationRecord
  belongs_to :booking

  validates :description, :rating, presence: true
end
