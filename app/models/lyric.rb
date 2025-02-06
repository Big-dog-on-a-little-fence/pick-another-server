class Lyric < ApplicationRecord
  belongs_to :tune
  has_rich_text :body
  validates :version, presence: true, length: { minimum:3, maximum: 50 }
  validates :body, presence: true
end
