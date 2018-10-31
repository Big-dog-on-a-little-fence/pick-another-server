FactoryBot.define do
  time_signatures = ['4/4', '3/4', '6/8', '5/4']
  factory :tune do
    name { Faker::Lorem.unique.characters(12) }
    key { Faker::Music.key }
    time_signature { time_signatures.sample }
  end
end
