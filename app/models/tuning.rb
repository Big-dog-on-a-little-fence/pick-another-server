class Tuning < ApplicationRecord
  default_scope { order(instrument_type: :asc, created_at: :asc) }
  has_many :tune_tunings
  has_many :tunes, through: :tune_tunings
end
