class InstrumentTune < ApplicationRecord
  validates_presence_of :instrument, :tune

  belongs_to :instrument
  belongs_to :tune
end
