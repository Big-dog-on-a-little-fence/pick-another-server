class Instrument < ApplicationRecord
  belongs_to :user
  has_many :instrument_tunes
  has_many :tunes, through: :instrument_tunes
  # has_many :instrument_repertoires
  # has_many :repertoires, through: :instrument_repertoires

  scope :accordions, -> { where(type: 'Accordion') } 
  scope :banjos, -> { where(type: 'Banjo') } 
  scope :basses, -> { where(type: 'Bass') } 
  scope :cellos, -> { where(type: 'Cello') }
  scope :clarinets, -> { where(type: 'Clarinet') }
  scope :fiddles, -> { where(type: 'Violin') }
  scope :guitars, -> { where(type: 'Guitar') }
  scope :mandolins, -> { where(type: 'Mandolin') }
  scope :pianos, -> { where(type: 'Piano') }
  scope :saxophones, -> { where(type: 'Saxophone') }
  scope :trombones, -> { where(type: 'Trombone') }
  scope :voices, -> { where(type: 'Voice') }

  def self.types
    %w(Accordion Banjo Bass Cello Clarinet Guitar Mandolin Piano Saxophone Trombone Violin Voice)
  end
  
  def has_tune?(tune)
    self.tunes.include?(tune)
  end
  
  def has_tune_return_int(tune)
    if self.tunes.include?(tune)
      return 1
    end
    return 0
  end
end
