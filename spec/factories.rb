# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { 'apple' }
    price  { 20 }
    description { 'dsg' }
    user
  end

  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    age { 20 }
    address { 'qwertyqw' }
    city
  end

  factory :city do
    name { 'Lviv' }
  end
end
