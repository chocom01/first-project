# frozen_string_literal: true

class City < ApplicationRecord
  has_many :users
  validates :name, length: { in: 3..15 }
end
