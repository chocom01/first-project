# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:owner_item) { create(:user) }
  let(:owner_review) { create(:user) }
  let(:item) { create(:item, user: owner_item) }
  let!(:booking) { create(:booking, user: owner_review, item: item) }
  let(:review) do
    build(
      :review,
      user: owner_review, reviewable: reviewable,
      review_rate: review_rate, review_text: review_text
    )
  end
  let(:reviewable) { item }
  let(:review_rate) { 4 }
  let(:review_text) { 'Very nice item' }

  context 'when all parameters valid' do
    it 'is valid' do
      expect(review).to be_valid
    end
  end

  shared_examples :invalid_review do |error_key|
    it 'is invalid' do
      expect(review).not_to be_valid
      expect(review.errors.keys).to include(error_key)
    end
  end

  context 'when review rate invalid' do
    let(:review_rate) { nil }

    it_behaves_like :invalid_review, :review_rate
  end

  context 'when review text invalid' do
    let(:review_text) { nil }

    it_behaves_like :invalid_review, :review_text
  end

  context 'when rights to live review invalid' do
    let(:booking) { create(:booking) }

    it_behaves_like :invalid_review, :user
  end
end
