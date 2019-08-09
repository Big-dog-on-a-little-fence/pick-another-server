class Tuning < ApplicationRecord
  has_many :tune_tunings
  has_many :tunes, through: :tune_tunings
end
