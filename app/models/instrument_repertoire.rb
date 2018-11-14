class InstrumentRepertoire < ApplicationRecord
  validates_presence_of :instrument, :repertoire
  
  belongs_to :instrument
  belongs_to :repertoire
  
  delegate :tune, to: :repertoire
  delegate :user, to: :instrument
end
