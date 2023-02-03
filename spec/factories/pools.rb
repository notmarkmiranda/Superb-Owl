FactoryBot.define do
  factory :pool do
    user { nil }
    name { "MyString" }
    active { false }
    lock { "2023-02-03 16:23:38" }
    finalize { "2023-02-03 16:23:38" }
    multiple_entries { false }
  end
end
