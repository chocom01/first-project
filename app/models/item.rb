# frozen_string_literal: true

class Item < ApplicationRecord
  paginates_per 10

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
  scope :by_name, ->(name) { where('name like ?', "#{name}%") }
  scope :by_user, ->(user_id) { where(user_id: user_id) }
  scope :by_category, ->(category_id) { where(category_id: category_id) }
  scope :by_options, lambda { |option_ids|
    joins(:options).where(options: { id: option_ids })
                   .having("count(option_id) = #{option_ids.size}")
                   .group(:id)
  }
  scope :price_min, ->(number) { where(arel_table[:price].gt(number)) }
  scope :price_max, ->(number) { where(arel_table[:price].lt(number)) }
end
