class Tune < ApplicationRecord
  #include PublicActivity::Model
  # tracked owner: ->(controller, model) { controller && controller.current_user }
  
  include PublicActivity::Common
  
  has_many :repertoires
  has_many :users, through: :repertoires
  has_many :tune_genres
  has_many :genres, through: :tune_genres
  has_many :sources
  has_one :lyric
  has_and_belongs_to_many :jams
  has_many :charts
  validates :name, presence: true, uniqueness: true, length: { minimum:3, maximum: 50 }
  validates :key, presence: true, length: { minimum:1, maximum: 5 }
end
