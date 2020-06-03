class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validate :date_available?

  def date_available?
    if car.can_book_for?(start_date, end_date)
      return true
    else
      errors.add(:dates, "dates are not available")
      return false
    end
  end
end
