FactoryBot.define do
  factory :tune do
    name { Faker::Lorem.unique.characters(12) }
    key { Faker::Music.key }
  end
end
