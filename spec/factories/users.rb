FactoryBot.define do
  factory :user do
    username { "test_username" }
    email { "testemail123@example.com" }
    password { "password123" }
  end
end
