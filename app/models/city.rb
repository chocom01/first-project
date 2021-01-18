class City < ApplicationRecord
  has_many :users
  validates :name, length: { in: 3..15 }
end
