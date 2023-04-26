FactoryBot.define do
  factory :question do
    pool
    tiebreaker { false }
  end

  factory :membership do
    pool
    user
    active { true }

    trait :member do
      role { 0 }
    end

    trait :admin do
      role { 1 }
    end
  end

  factory :pool do
    sequence(:name) { |n| "#{Faker::Team.name} #{n}" }
    association :super_admin, factory: :user
    active { false }
    locked { false }
    game { 0 }
    finalized { false }
    archived { false }
    public_pool { true }
  end

  factory :user do
    sequence(:email) { |n| Faker::Internet.email(domain: "propbets#{n}") }
    password { "password" }
    nickname { Faker::FunnyName.two_word_name }
  end
end
