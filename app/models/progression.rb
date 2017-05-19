class Progression < ApplicationRecord
  belongs_to :chart
  has_many :chords
end
