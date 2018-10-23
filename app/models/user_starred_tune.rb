class UserStarredTune < ApplicationRecord
  validates_presence_of :user, :tune
  
  belongs_to :user
  belongs_to :tune
  
  GOALS = ["want to learn", "currently learning", "reinforce", "practice variations", 
           "work on speed", "work on improvisation", "learn harmonizing melody"].freeze
end
