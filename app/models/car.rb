class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  geocoded_by :location

  validates :name, :year, :seats, :price, :location, presence: true
  after_validation :geocode, if: :will_save_change_to_location?

  def search_bookings_by_status(status = [])
    bookings.where(status: status)
  end

  def unavailable_dates
    # get an array of [start_date, end_date] then map into Hash object
    bookings.where("end_date > ?", DateTime.now).pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def can_book_for?(start_date, end_date)
    !bookings.exists?(['start_date >= ? AND end_date <= ?', start_date, end_date])
  end

  def average_rating
    my_reviews = reviews
    return 0 if my_reviews.count.zero?

    my_reviews.reduce(0) { |sum, review| sum + review.rating }.fdiv(my_reviews.count).ceil(2)
  end

  def pending_bookings
    bookings.where(status: Booking::BOOKING_STATUS[:pending])
  end

  def declined_bookings
    bookings.where(status: Booking::BOOKING_STATUS[:declined])
  end

  def approved_bookings
    bookings.where(status: Booking::BOOKING_STATUS[:approved])
  end

  # include PgSearch::Model
  # multisearchable against: [:location]
end
