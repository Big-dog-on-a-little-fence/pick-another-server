class Lyric < ApplicationRecord
  belongs_to :tune
  validates :version, presence: true, length: { minimum:3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 20, maximum: 5000 }
end
