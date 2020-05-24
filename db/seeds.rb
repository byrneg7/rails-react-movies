# frozen_string_literal: true

require 'database_cleaner/active_record'
DatabaseCleaner.strategy = :truncation, { only: %w[movies chatrooms] }
DatabaseCleaner.clean

def generate_email_array
  email_arr = []
  5.times do
    email_arr << Faker::Internet.email
  end
  email_arr
end

puts "\nSeeding db... \n"

puts "\t Seeding Movies..."
10.times do
  Movie.create(
    title: Faker::Book.title,
    plot: Faker::Lorem.paragraph,
    release_date: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
end

puts "\t Seeding Chatrooms..."
10.times do
  Chatroom.create(
      name: Faker::Book.title,
      description: Faker::Lorem.paragraph,
      members:  generate_email_array
  )
end

puts "Seeding finished... \n \n"