# frozen_string_literal: true

class Item < ApplicationRecord
  paginates_per 3

  belongs_to :user
  belongs_to :category

  has_many :bookings
  has_many :reviews, as: :reviewable
  has_and_belongs_to_many :options

  validates :name, length: { in: 3..10 }
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0, allow_nil: true }

  scope :by_city,
        ->(city_id) { joins(user: :city).where(cities: { id: city_id }) }
end
