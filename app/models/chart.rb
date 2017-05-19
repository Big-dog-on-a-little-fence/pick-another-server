class Chart < ApplicationRecord
  belongs_to :tune
  has_many :progressions
  
  accepts_nested_attributes_for :progressions
  # attr_accessible :progressions_attributes
end
