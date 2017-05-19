class Chart < ApplicationRecord
  belongs_to :tune
  has_many :progressions
  
  accepts_nested_attributes_for :progressions
end
