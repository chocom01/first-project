# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user

  validate :rights_to_live_review
  validates :review_rate, numericality: {
    only_integer: true, greater_than: 0, less_than: 6
  }
  validates :review_text, length: { in: 5..30 }

  private

  def rights_to_live_review
    case reviewable_type
    when 'Item'
      user_booked_item? || errors.add(:user, "didn't book item")
    when 'User'
      user_booked_item_of_owner? || errors.add(:user, "didn't book in the user")
    else
      errors.add(:reviewable_type, :invalid)
    end
  end

  def user_booked_item?
    Booking.where(user_id: user_id, item_id: reviewable_id).empty?
  end

  def user_booked_item_of_owner?
    Booking.joins(:item)
           .where(user_id: user_id, items: { user_id: reviewable_id }).empty?
  end
end
