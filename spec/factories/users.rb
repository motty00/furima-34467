FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { 'hoge123' }
    password_confirmation { password }
    name                  { Faker::Name.initials(number: 5) }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    last_name_kana        { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    birth_date            { Faker::Date.in_date_period }
  end
end
