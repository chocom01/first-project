# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#validate' do
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

  describe '.by_city' do
    subject { described_class.by_city(city) }
    let!(:owner) { create(:user, city: city) }

    context 'when Kiev has items' do
      let(:city) { create(:city, name: 'Kiev') }
      let(:item1) { create(:item, user: owner) }
      let(:item2) { create(:item, user: owner) }

      it 'subject has array items' do
        expect(subject).to match_array([item1, item2])
      end
    end

    context 'when Ternopil has no item' do
      let(:city) { create(:city, name: 'Ternopil') }
      let!(:item) { create(:item) }

      it 'empty subject' do
        expect(subject).to eq([])
      end
    end
  end

  describe '.filter_by_start_with' do
    subject { described_class.filter_by_start_with(item_name) }

    let(:name) { 'iphone' }
    let(:item_name) { name }
    let!(:item) { create(:item, name: name) }

    context 'when search by start of name successful' do
      let(:item_name) { 'ip' }

      it 'subject has search name by 2 first letter' do
        expect(subject).to match_array(item)
      end
    end

    context 'when search by start of name failed' do
      let(:item_name) { 'parasha' }

      it 'subject has array items' do
        expect(subject).to eq([])
      end
    end
  end

  describe '.by_category' do
    subject { described_class.by_category(category) }
    let(:category) { create(:category, name: 'electronics') }

    context 'when items has category electronics' do
      let(:item1) { create(:item, name: 'iphone', category: category) }
      let(:item2) { create(:item, name: 'mp3', category: category) }

      it 'subject has search items by category' do
        expect(subject).to match_array([item1, item2])
      end
    end

    context 'when item has defoult category' do
      let(:item) { create(:item) }

      it 'subject has empty array' do
        expect(subject).to eq([])
      end
    end
  end

  describe '#by_options' do
  subject { described_class.by_options(options) }

  let(:option1) { create(:option) }
  let(:option2) { create(:option) }
  let!(:item1) { create(:item, options: [option1, option2]) }
  let(:options) { [option1, option2] }

  context 'when we have two options' do
    it 'show items with options' do
      expect(subject).to match_array(item1)
    end
  end

  context 'when options don\'t have items' do
    let(:options) { [create(:option)] }

    it 'show empty array' do
      expect(subject).to eq([])
    end
  end
end
end
