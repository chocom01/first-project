# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = City.create(
  [
    { name: 'Lviv' },
    { name: 'Ternopil' }
  ]
)
users = User.create(
  [
    { first_name: 'Kolya', last_name: 'Vasyliv',
      age: 20, address: 'qwerty', city_id: 1 },
    { first_name: 'Igor', last_name: 'Ksdgdsg',
      age: 20, address: 'qwerty', city_id: 1 },
    { first_name: 'Nazar', last_name: 'Klfjhdlf',
      age: 22, address: 'qwerty', city_id: 2 },
    { first_name: 'Taras', last_name: 'Dsfas',
      age: 21, address: 'qwerty', city_id: 2 }
  ]
)
filters = Filter.create(
  [
    { name: 'Brand' },
    { name: 'Color' }
  ]
)
categories = Category.create(
  [
    { name: 'electronics', filters: Filter.find(1, 2) },
    { name: 'furniture', filters: Filter.find(1, 2) }
  ]
)
option = Option.create(
  [
    { value: 'Apple', filter_id: 1 },
    { value: 'Samsung', filter_id: 1 },
    { value: 'Ikea', filter_id: 1 },
    { value: 'Black', filter_id: 2 },
    { value: 'White', filter_id: 2 }
  ]
)
items = Item.create(
  [
    { name: 'Laptop', description: 'Extra fast cpu',
      price: 500, user_id: 1, category_id: 1, options: Option.find(1, 4) },
    { name: 'Smartphone', description: '128 gb memory',
      price: 400, user_id: 1, category_id: 1, options: Option.find(2, 4) },
    { name: 'Mp3', description: '4 gb memory',
      price: 30, user_id: 1, category_id: 1, options: Option.find(1, 5) },
    { name: 'Monitor', description: 'Ultra HD',
      price: 150, user_id: 1, category_id: 1, options: Option.find(2, 5) },
    { name: 'Chair', description: 'High quality',
      price: 20, user_id: 1, category_id: 2, options: Option.find(3, 4) },
    { name: 'Table', description: 'High quality',
      price: 50, user_id: 1, category_id: 2, options: Option.find(3, 4) }
  ]
)
booking = Booking.create(
  [
    { user_id: 2, item_id: 4, start_rent_at: '01.01.20', end_rent_at: '02.01.20' },
    { user_id: 3, item_id: 3, start_rent_at: '01.01.20', end_rent_at: '02.01.20' },
    { user_id: 4, item_id: 3, start_rent_at: '01.01.20', end_rent_at: '02.01.20' }
  ]
)
reviews = Review.create(
  [
    { user_id: 2, reviewable: Item.find(4),
      review_rate: 1, review_text: 'bad monitor' },
    { user_id: 3, reviewable: Item.find(3),
      review_rate: 1, review_text: 'bad Mp3' },
    { user_id: 4, reviewable: Item.find(3),
      review_rate: 1, review_text: 'bad Mp3' }
  ]
)
