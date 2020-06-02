class Car < ApplicationRecord
  belongs_to :users

  validates :name, :year, :seats, :price, :location, presence: true
end
