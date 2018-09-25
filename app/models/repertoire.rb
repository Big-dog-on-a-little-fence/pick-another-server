class Repertoire < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :user
  belongs_to :tune
  has_many :instruments
end