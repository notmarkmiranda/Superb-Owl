FactoryBot.define do
  factory :pool do
    user
    sequence(:name) { |n| "Swimming Pools #{n}" }
    active { false }
    lock { nil }
    finalize { nil }
    multiple_entries { false }
  end
end
