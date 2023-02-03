FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name  }
    last_name { Faker::Name.last_name  }
    nickname { Faker::Superhero.name }
    email { Faker::Internet.email }
    confirmation_code { nil }
    confirmation_expiration { nil }
  end
end
