FactoryBot.define do
  factory :mywork do
    sequence(:name) { |n| "mywork#{n}" }
  end
end
