class Tuning < ApplicationRecord
  default_scope { order(instrument_type: :asc, created_at: :asc) }
  has_many :tune_tunings
  has_many :tunes, through: :tune_tunings
  
  def has_tune?(tune)
    self.tunes.include?(tune)
  end  
  
  def instrument_type_notes_and_name
    "#{self.notes} on #{self.instrument_type} (#{self.name})"
  end
  
end
