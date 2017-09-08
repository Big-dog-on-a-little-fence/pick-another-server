class Progression < ApplicationRecord
  default_scope { order(part_number: :asc) }
  belongs_to :chart
  has_many :measures, inverse_of: :progression
  has_many :chords
  
  accepts_nested_attributes_for :measures, allow_destroy: true
  
  validates :part_number, presence: true
end
