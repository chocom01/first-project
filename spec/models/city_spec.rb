# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) { build(:city, name: name) }
  let(:name) { 'Lviv' }

  context 'when all parameters valid' do
    it 'is valid' do
      expect(city).to be_valid
    end
  end

  context 'when city name invalid' do
    let(:name) { nil }

    it 'is invalid' do
      expect(city).not_to be_valid
      expect(city.errors.keys).to include(:name)
    end
  end
end
