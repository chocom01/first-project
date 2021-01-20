# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  let(:booking) do
    build(
      :booking,
      start_rent_at: start_rent_at, end_rent_at: end_rent_at
    )
  end

  let(:start_rent_at) { '01.01.2000' }
  let(:end_rent_at) { '01.01.2000' }

  context 'when all parameters valid' do
    it 'is valid' do
      expect(booking).to be_valid
    end
  end

  shared_examples :invalid_booking do |error_key|
    it 'is invalid' do
      expect(booking).not_to be_valid
      expect(booking.errors.keys).to include(error_key)
    end
  end

  context 'when booking invalid' do
    let(:start_rent_at) { nil }

    it_behaves_like :invalid_booking, :start_rent_at
  end

  context 'when end_rent_at invalid' do
    let(:end_rent_at) { nil }

    it_behaves_like :invalid_booking, :end_rent_at
  end
end
