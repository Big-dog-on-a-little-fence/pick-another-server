class Repertoire < ActiveRecord::Base
  include PublicActivity::Common
  
  validates_presence_of :user, :tune
  
  belongs_to :user
  belongs_to :tune
  has_many :instruments
end