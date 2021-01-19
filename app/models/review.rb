class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user

  validate :assotiation

  def assotiation
    if reviewable_type == 'Item'
      if Booking.where(user_id: user_id, item_id: reviewable_id).empty?
        errors.add(:user_id, "User didn't have item")
      end
    elsif reviewable_type == 'User'
      if Booking.joins(:item).where(user_id: user_id, items: { user_id: reviewable_id }).empty?
        errors.add(:user_id, "the user didn't borrow from the user")
      end
    else
      errors.add(:reviewable_type, :invalid)
    end
  end
end
