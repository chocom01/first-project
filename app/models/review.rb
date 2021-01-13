class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user

  validate :assotiation

  def assotiation
    case reviewable_type
    when 'Item'
      errors.add(:user, "didn't have item") if Booking.where(user_id: user_id, item_id: reviewable_id).empty?
    when 'User'
      if Booking.joins(:item).where(user_id: user_id, items: { user_id: reviewable_id }).empty?
        errors.add(:user, "didn't borrow from the user")
      end
    else
      errors.add(:reviewable_type, :invalid)
    end
  end
end
