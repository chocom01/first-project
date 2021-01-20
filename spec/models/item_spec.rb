# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) do
    build(
      :item,
      name: name, description: description, price: price
    )
  end

  let(:name) { 'Smartphone' }
  let(:description) { 'Cool item' }
  let(:price) { 2.0 }

  context 'when all parameters valid' do
    it 'is valid' do
      expect(item).to be_valid
    end
  end

  shared_examples :invalid_item do |error_key|
    it 'is invalid' do
      expect(item).not_to be_valid
      expect(item.errors.keys).to include(error_key)
    end
  end

  context 'when item name invalid' do
    let(:name) { nil }

    it_behaves_like :invalid_item, :name
  end

  context 'when description invalid' do
    let(:description) { nil }

    it_behaves_like :invalid_item, :description
  end

  context 'when price invalid' do
    let(:price) { 'string' }

    it_behaves_like :invalid_item, :price
  end
end
