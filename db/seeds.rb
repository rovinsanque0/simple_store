# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Example:
# #
# #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# #     MovieGenre.find_or_create_by!(name: genre_name)
# #   end



# require 'faker'



# puts "Seeding 676 products: "

# 676.times do
#   Product.create(
#     title: Faker::Commerce.product_name,
#     description: Faker::Lorem.sentence(word_count: 10),
#     price: Faker::Commerce.price(range: 5.0..500.0),
#     stock_quantity: Faker::Number.between(from: 1, to: 100)
#   )
# end

# puts "Done"
# 
#
#



require "csv"

puts "Clearing old data:"
Product.destroy_all
Category.destroy_all

puts "Seeding from CSV:"

csv_path = Rails.root.join("db/products.csv")

CSV.foreach(csv_path, headers: true) do |row|
  category_name = row["category"]
  category = Category.find_or_create_by(name: category_name)

  Product.create!(
    title: row["title"],
    description: row["description"],
    price: row["price"],
    stock_quantity: row["stock_quantity"],
    category: category
  )
end

puts "Done. Seeded #{Product.count} products across #{Category.count} categories."
