FactoryBot.define do
  factory :repertoire do
    user { association :user }
    tune { association :tune }
    
    factory :repertoire_with_instrument_tunes do
      transient do
        instrument_tunes_count { 5 }
      end
      ## instrument_tunes need instruments
      after(:create) do |repertoire, evaluator|
        create_list(:instrument_tune, evaluator.instrument_tunes_count, repertoire: repertoire,
                    instrument: create(:instrument), tune: tune)
      end
    end
  end
end
