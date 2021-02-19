FactoryBot.define do
  factory :item do
    name                    { 'test' }
    info                    { 'test' }
    price                   { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id             { Faker::Number.between(from: 2, to: 11) }
    status_id               { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id         { Faker::Number.between(from: 2, to: 3) }
    prefecture_id           { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id   { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
