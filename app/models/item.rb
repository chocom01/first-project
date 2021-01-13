class Item < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :reviews, as: :reviewable

  scope :by_city, ->(city_id) { joins(user: :city).where(cities: { id: city_id }) }
end
