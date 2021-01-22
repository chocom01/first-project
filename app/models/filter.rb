# frozen_string_literal: true

class Filter < ApplicationRecord
  has_many :options
  has_and_belongs_to_many :category
end
