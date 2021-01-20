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

  factory :booking do
    user
    item
    start_rent_at { '01.01.2000' }
    end_rent_at { '02.01.2000' }
  end

  factory :review do
    user
    for_item
    review_rate { 2 }
    review_text { 'Very nice item' }
  end

  trait :for_item do
    association :reviewable, factory: :item
  end

  trait :for_user do
    association :reviewable, factory: :user
  end
end
