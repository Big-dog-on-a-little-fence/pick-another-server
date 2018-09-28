FactoryBot.define do
  factory :repertoire do
    user { association :user }
    tune { association :tune }
    # instruments
  end
end
