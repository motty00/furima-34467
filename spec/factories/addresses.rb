FactoryBot.define do
  factory :address do
    postal_code            { "123-4567" }
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    city                   { Gimei.city.kanji }
    address                { "青山1-1-1" }
    building               { "柳ビル103" }
    phone_number           { Faker::Number.leading_zero_number(digits: 11) }
    association :order
  end
end
