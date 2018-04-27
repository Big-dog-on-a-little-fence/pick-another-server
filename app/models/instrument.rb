class Instrument < ApplicationRecord
  belongs_to :user

  scope :banjos, -> { where(type: 'Banjo') } 
  scope :basses, -> { where(type: 'Bass') } 
  scope :cellos, -> { where(type: 'Cello') }
  scope :fiddles, -> { where(type: 'Fiddle') }
  scope :guitars, -> { where(type: 'Guitar') }
  scope :mandolins, -> { where(type: 'Mandolin') }
  scope :voices, -> { where(type: 'Voice') }

  def self.types
    %w(Banjo Bass Cello Fiddle Guitar Mandolin Voice)
  end
end
