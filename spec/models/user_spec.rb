# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    build(
      :user,
      first_name: first_name, last_name: last_name, age: age, address: address
    )
  end
  let(:first_name) { 'John' }
  let(:last_name) { 'Doe' }
  let(:age) { 20 }
  let(:address) { 'Lviv, St. Stryiska 22' }

  context 'when all parameters valid' do
    it 'is valid' do
      expect(user).to be_valid
    end
  end

  shared_examples :invalid_user do |error_key|
    it 'is invalid' do
      expect(user).not_to be_valid
      expect(user.errors.keys).to include(error_key)
    end
  end

  context 'when first name invalid' do
    let(:first_name) { nil }

    it_behaves_like :invalid_user, :first_name
  end

  context 'when last name invalid' do
    let(:last_name) { nil }

    it_behaves_like :invalid_user, :last_name
  end

  context 'when age invalid' do
    let(:age) { nil }

    it_behaves_like :invalid_user, :age
  end

  context 'when address invalid' do
    let(:address) { nil }

    it_behaves_like :invalid_user, :address
  end
end
