class Car < ApplicationRecord
  belongs_to :users

  validates :name, presence: true
  validates :year, presence: true
  validates :seats, presence: true
  validates :price, presence: true
  validates :location, presence: true
end
