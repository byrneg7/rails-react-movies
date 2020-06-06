# frozen_string_literal: true

require 'database_cleaner/active_record'
DatabaseCleaner.strategy = :truncation, { only: %w[users] }
DatabaseCleaner.clean

p "\nSeeding db... \n"

puts "\t Creating Users..."
10.times do
  Chatroom.create(
      name: Faker::Name.first_name + Faker::Name::last_name,
      description: Faker::Lorem.paragraph,
      members:  generate_email_array
  )
end

p "Seeding finished... \n \n"