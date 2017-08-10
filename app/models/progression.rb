class Progression < ApplicationRecord
  belongs_to :chart
  has_many :measures
  has_many :chords
  
  accepts_nested_attributes_for :measures, allow_destroy: true
  
  #validates :chord_list, presence: true
end
