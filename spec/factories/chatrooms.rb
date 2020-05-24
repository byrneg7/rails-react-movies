FactoryBot.define do
  factory :chatroom do
    name { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    members { generate_email_array }
  end
end

private_methods

def generate_email_array
  email_arr = []
  5.times do
    email_arr << Faker::Internet.email
  end
  email_arr
end
