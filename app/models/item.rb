class Item < ApplicationRecord
  paginates_per 3

  belongs_to :user

  has_many :bookings
  has_many :reviews, as: :reviewable

  validates :name, length: { in: 3..10 }
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0, allow_nil: true }

  scope :by_city,
        ->(city_id) { joins(user: :city).where(cities: { id: city_id }) }
end
