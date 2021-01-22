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
        ->(city) { joins(user: :city).where(cities: { id: city }) }
  scope :filter_by_start_with, ->(name) { where('name like ?', "#{name}%") }
  scope :by_category, ->(category_id) { where(category_id: category_id) }
  scope :by_options, lambda { |options|
    joins(:options).where(options: { id: options.pluck(:id) })
                   .having("count(option_id) = #{options.size}")
                   .group(:id)
  }
end
