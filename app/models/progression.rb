class Progression < ApplicationRecord
  belongs_to :chart
  has_many :measures, -> { order(created_at: :asc) }
  has_many :chords
  
  accepts_nested_attributes_for :measures, allow_destroy: true
  
  #validates :chord_list, presence: true
end
