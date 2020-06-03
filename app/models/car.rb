class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :year, :seats, :price, :location, presence: true

  def unavailable_dates
    # get an array of [start_date, end_date] then map into Hash object
    bookings.where("end_date > ?", DateTime.now).pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def can_book_for?(start_date, end_date)
    !bookings.exists?(['id = ? AND (start_date >= ? AND end_date <= ?)', id, start_date, end_date])
  end
end
