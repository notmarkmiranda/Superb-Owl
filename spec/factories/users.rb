FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    nickname { "MyString" }
    email { "MyString" }
    confirmation_code { "MyString" }
    confirmation_expiration { "2023-02-02 22:44:05" }
  end
end
