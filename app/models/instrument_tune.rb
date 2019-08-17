class InstrumentTune < ApplicationRecord
  include PublicActivity::Common
  
  validates_presence_of :instrument, :tune

  belongs_to :instrument
  belongs_to :tune

  delegate :user, to: :instrument
end
