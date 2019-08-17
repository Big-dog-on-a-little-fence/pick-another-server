FactoryBot.define do
  factory :repertoire do
    user { association :user }
    tune { association :tune }
    
    factory :repertoire_with_instrument_repertoires do
      transient do
        instrument_repertoires_count { 5 }
      end
      ## instrument_repertoires need instruments
      after(:create) do |repertoire, evaluator|
        create_list(:instrument_repertoire, evaluator.instrument_tunes_count, repertoire: repertoire,
                    instrument: create(:instrument), tune: tune)
      end
    end
  end
end
