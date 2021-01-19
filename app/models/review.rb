# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user

  validate :rights_to_live_review

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
