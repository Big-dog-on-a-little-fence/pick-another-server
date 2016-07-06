class Tune < ApplicationRecord
  has_many :repertoires
  has_many :users, through: :repertoires
  has_many :tune_genres
  has_many :genres, through: :tune_genres
  validates :name, presence: true, :uniqueness => {:case_sensitive => false}, length: { minimum:3, maximum: 50 }
  validates :key, presence: true, length: { minimum:1, maximum: 5 }
end
