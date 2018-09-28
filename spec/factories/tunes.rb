FactoryBot.define do
  factory :tune do
    name { Faker::Music.unique.album }
    key { Faker::Music.key }
  end
end
