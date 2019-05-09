FactoryBot.define do
  factory :message do
    body{Faker::Lorem.paragraph}
    user
    group
    parent_id{nil}
  end
end
