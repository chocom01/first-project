# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :items
  has_and_belongs_to_many :filters
end
