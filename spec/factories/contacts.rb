FactoryGirl.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    birthdate { Faker::Date.birthday(18, 65) }
    address { Faker::Address.street_address }
    cellphone { "(85) #{Faker::PhoneNumber.subscriber_number(9)}" }
    gender { ["M","F"].sample }
    user
  end
end
