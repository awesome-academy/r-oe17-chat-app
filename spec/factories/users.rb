FactoryBot.define do
  factory :user do
    name{Faker::Name.name}
    email{Faker::Internet.email}
    title{"Mr"}
    address{Faker::Address.street_address}
    mobile{Faker::PhoneNumber.phone_number}
    password{"abcd1234"}
  end
end
