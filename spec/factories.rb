FactoryBot.define do
  factory :pool do
    sequence(:name) { |n| "#{Faker::Team.name} #{n}" }
    user
      active { false }
    locked { false }
    game { 0 }
    finalized { false }
    archived { false }
  end

  factory :user do
    sequence(:email) { |n| Faker::Internet.email(domain: "propbets#{n}") }
    password { "password" }
    nickname { Faker::FunnyName.two_word_name }
  end
end
