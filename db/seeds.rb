# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# cities = City.create([{ name: 'Lviv' }, { name: 'Kiev' }])
# users = User.create([{ first_name: 'John', city_id: 1 }, { first_name: 'Cj', city_id: 2 }])
# items = Item.create([{ name: 'PC', user_id: 1 }, { name: 'smartphone', user_id: 1 }])
# reviews = Review.create([{ user_id: 2, reviewable: Item.find(1) },
#   { user_id: 2, reviewable: Item.find(2) }])
cities = City.create(
  [
    { name: 'Lviv' },
    { name: 'Ternopil' }
  ]
)
users = User.create(
  [
    { first_name: 'Kolya', last_name: 'Vasyliv', age: 20, address: 'qwerty', city_id: 1 },
    { first_name: 'Igor', last_name: 'Ksdgdsg', age: 20, address: 'qwerty', city_id: 1 },
    { first_name: 'Nazar', last_name: 'Klfjhdlf', age: 22, address: 'qwerty', city_id: 2 },
    { first_name: 'Taras', last_name: 'Dsfas', age: 21, address: 'qwerty', city_id: 2 }
  ]
)
items = Item.create(
  [
    { name: 'PC1', description: 'qwe', price: 2, user_id: 1 },
    { name: 'table', description: 'qwe', price: 5, user_id: 1 },
    { name: 'smartphone', description: 'qwe', price: 21, user_id: 1 },
    { name: 'MP3', description: 'qwe', price: 5, user_id: 1 },
    { name: 'mouse', description: 'qwe', price: 1, user_id: 1 },
    { name: 'vallet', description: 'qwe', price: 2, user_id: 1 },
    { name: 'key', description: 'qwe', price: 2, user_id: 1 }
  ]
)
reviews = Review.create(
  [
    { user_id: 2, reviewable: Item.find(1) },
    { user_id: 2, reviewable: Item.find(2) },
    { user_id: 1, reviewable: Item.find(3) },
    { user_id: 1, reviewable: Item.find(5) },
    { user_id: 1, reviewable: Item.find(6) },
    { user_id: 1, reviewable: Item.find(7) }
  ]
)
booking = Booking.create(
  [
    { user_id: 1, item_id: 4 },
    { user_id: 2, item_id: 3 },
    { user_id: 4, item_id: 3 }
  ]
)
