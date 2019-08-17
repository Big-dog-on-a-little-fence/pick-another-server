FactoryBot.define do

  factory :accordion, class: Accordion do
    type { 'Accordion' }
    user { association :user }
  end

  factory :banjo, class: Banjo do
    type { 'Banjo' }
    user { association :user }
  end

  factory :bass, class: Bass do
    type { 'Bass' }
    user { association :user }
  end

  factory :cello, class: Cello do
    type { 'Cello' }
    user { association :user }
  end

  factory :clarinet, class: Clarinet do
    type { 'Clarinet' }
    user { association :user }
  end

  factory :guitar, class: Guitar do
    type { 'Guitar' }
    user { association :user }
  end

  factory :mandolin, class: Mandolin do
    type { 'Mandolin' }
    user { association :user }
  end

  factory :piano, class: Piano do
    type { 'Piano' }
    user { association :user }
  end

  factory :saxophone, class: Saxophone do
    type { 'Saxophone' }
    user { association :user }
  end

  factory :trombone, class: Trombone do
    type { 'Trombone' }
    user { association :user }
  end

  factory :violin, class: Violin do
    type { 'Violin' }
    user { association :user }
  end

  factory :voice, class: Voice do
    type { 'Voice' }
    user { association :user }
  end

  factory :instrument, class: Instrument do
    type { Instrument.types.sample }
    user { association :user }
    
    factory :instrument_with_tunes do
      transient do
        tunes_count { 5 }
      end
      after(:create) do |instrument, evaluator|
        # repertoires missing from instrument_tunes
        create_list(:tune, evaluator.tunes_count, instruments: [instrument], users:[instrument.user])
      end
    end
  end

end
