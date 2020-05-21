# frozen_string_literal: true

require 'database_cleaner/active_record'
DatabaseCleaner.strategy = :truncation, { only: %w[movies] }
DatabaseCleaner.clean

10.times do
  Movie.create(
    title: Faker::Book.title,
    plot: Faker::Lorem.paragraph,
    release_date: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
end
