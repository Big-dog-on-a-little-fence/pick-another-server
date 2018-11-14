class Repertoire < ActiveRecord::Base
  include PublicActivity::Common
  
  validates_presence_of :user, :tune
  
  belongs_to :user
  belongs_to :tune
  has_many :instrument_repertoires
  has_many :instruments, through: :instrument_repertoires
  
  accepts_nested_attributes_for :instrument_repertoires, allow_destroy: true
end