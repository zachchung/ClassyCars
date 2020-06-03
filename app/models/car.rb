class Car < ApplicationRecord
  belongs_to :user

  validates :name, :year, :seats, :price, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
