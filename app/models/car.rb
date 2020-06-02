class Car < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, :year, :seats, :price, :location, presence: true
end
