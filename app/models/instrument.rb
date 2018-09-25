class Instrument < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tunes
  
  # validates_presence_of :user

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

end
