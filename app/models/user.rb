# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :city

  has_many :items
  has_many :bookings
  has_many :reviews, as: :reviewable
  has_many :own_reviews, class_name: 'Review'
  has_many :items_review, through: :items, source: :reviews

  validates :first_name, :last_name, length: { in: 3..10 }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18, less_than: 100 }
  validates :address, length: { in: 6..15 }
end
