class Repertoire < ActiveRecord::Base
  # include PublicActivity::Model
  # tracked owner: ->(controller, model) { controller && controller.current_user }
  
  include PublicActivity::Common
  
  belongs_to :user
  belongs_to :tune
end