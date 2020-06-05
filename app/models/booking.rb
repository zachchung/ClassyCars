class Booking < ApplicationRecord
  BOOKING_STATUS = {
    pending: "pending",
    renting: "renting",
    confirmed: "confirmed",
    cancelled: "cancelled",
    returned: "returned",
    declined: "declined"
  }

  belongs_to :car
  belongs_to :user
  has_one :review

  validates :start_date, :end_date, presence: true
  validate :date_available?, on: :create

  def date_available?
    if car.can_book_for?(start_date, end_date)
      return true
    else
      errors.add(:dates, "Selected dates are not available to book!")
      return false
    end
  end

  def approved
    update(status: BOOKING_STATUS[:confirmed])
  end

  def declined
    update(status: BOOKING_STATUS[:declined])
  end

  def duration
    (end_date - start_date).to_i
  end
end
