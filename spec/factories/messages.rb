FactoryBot.define do
  factory :message do
    body{Faker::Lorem.paragraph}
    user
    parent_id{nil}
  end
end
