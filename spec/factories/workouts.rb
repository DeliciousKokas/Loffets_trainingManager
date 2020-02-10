FactoryBot.define do
  factory :workout do
    set {4}
    rep {12}
    sequence(:weight) { |n| 40 + n }
    vol {set*rep*weight}
    record_id nil
    mywork_id nil
  end
end
