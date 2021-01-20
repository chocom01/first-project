# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { 'apple' }
    price  { 20 }
    description { 'Cool item' }
    user
  end

  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    age { 20 }
    address { 'Lviv, St. Stryiska 22' }
    city
  end

  factory :city do
    name { 'Lviv' }
  end
end
