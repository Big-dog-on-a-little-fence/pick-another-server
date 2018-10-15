class UserStarredTune < ApplicationRecord
  validates_presence_of :user, :tune
  
  belongs_to :user
  belongs_to :tune
  
  GOALS = ["want to learn", "reinforce", "practice variations", "work on improvisation",
           "learn harmonizing melody", "other"].freeze
end
