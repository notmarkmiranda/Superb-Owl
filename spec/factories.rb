FactoryBot.define do
  factory :user do
    sequence(:email) { |n| Faker::Internet.email(domain: "propbets#{n}") }
    password_digest { "password" }
    nickname { Faker::FunnyName.two_word_name }
  end
end
