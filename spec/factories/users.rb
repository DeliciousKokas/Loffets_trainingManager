FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@test.com" }
    sequence(:name) { |n| "test#{n}" }
    password { 'test!1234' }
  end
end
