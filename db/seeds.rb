# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create colors
20.times do
  Color.create(name: Faker::Color.unique.color_name)
end

# Create sizes
['small', 'medium', 'large', 'huge'].each do |size|
  Size.create(name: size)
end

# Create categories
['health', 'sports', 'artisanal'].each do |category|
  Category.create(name: category)
end

# Create widgets
100.times do
  Widget.create(
    name: Faker::Hipster.unique.word,
    quantity: Faker::Number.non_zero_digit,
    color_id: Color.order("RANDOM()").first.id,
    size_id: Size.order("RANDOM()").first.id,
    category_id: Category.order("RANDOM()").first.id
  )
end
