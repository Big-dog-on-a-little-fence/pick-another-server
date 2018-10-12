class UserStarredTune < ApplicationRecord
  validates_presence_of :user, :tune
  
  belongs_to :user
  belongs_to :tune
end
