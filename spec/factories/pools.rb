FactoryBot.define do
  factory :pool do
    user
    sequence(:name) { |n| "Swimming Pools #{n}" }
    active { false }
    lock { "2023-02-03 16:23:38" }
    finalize { "2023-02-03 16:23:38" }
    multiple_entries { false }
  end
end
