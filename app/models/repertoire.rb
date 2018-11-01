class Repertoire < ActiveRecord::Base
  include PublicActivity::Common
  
  validates_presence_of :user, :tune
  
  belongs_to :user
  belongs_to :tune
  has_many :instrument_tunes
  
  def instruments
    self.instrument_tunes.map {|it| it.instrument}
  end
  
  def has_instrument?(instrument)
    instruments.include?(instrument)
  end
  
  def has_instrument_by_id?(instrument_id)
    instrument_ids = instruments.map {|instrument| instrument.id}
    instrument_ids.include?(instrument_id)
  end
end