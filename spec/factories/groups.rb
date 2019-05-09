FactoryBot.define do
  factory :group do
    name{Faker::Name.name}
    is_active{true}
  end
end
