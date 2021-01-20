class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :start_rent_at, :end_rent_at, presence: true
end
