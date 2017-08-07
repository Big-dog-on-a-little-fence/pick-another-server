class Progression < ApplicationRecord
  belongs_to :chart
  has_many :chords
  
  validates :chord_list, presence: true
end
