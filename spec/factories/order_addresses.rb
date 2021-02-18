FactoryBot.define do
  factory :order_address do
    postal_code             { '123-1234' }
    prefecture_id           { Faker::Number.between(from: 2, to: 48) }
    city                    { Gimei.city.kanji }
    address                 { '1542-3' }
    building                { '柳ビル103' }
    phone_number            { Faker::Number.leading_zero_number(digits: 11) }

    token { 'tok_abcdefghijk00000000000000000' }
  end
end
