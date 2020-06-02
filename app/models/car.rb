class Car < ApplicationRecord
  belongs_to :user

  validates :name, :year, :seats, :price, :location, presence: true
end
