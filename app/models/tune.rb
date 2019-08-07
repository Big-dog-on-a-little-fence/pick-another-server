class Tune < ApplicationRecord
  include PublicActivity::Common

  has_many :instrument_tunes
  has_many :instruments, through: :instrument_tunes
  has_many :users, -> { uniq }, through: :instruments
  has_many :user_starred_tunes
  has_many :users_that_have_starred, through: :user_starred_tunes, source: :user
  has_many :tune_genres
  has_many :genres, through: :tune_genres
  has_many :sources
  has_one :lyric
  has_and_belongs_to_many :jams
  has_many :charts
  has_many :comments, as: :commentable

  validates :name, presence: true, uniqueness: true, length: { minimum:3, maximum: 50 }
  validates :key, presence: true, length: { minimum:1, maximum: 5 }
  
  scope :user_tunes, ->(user) { joins(:instruments).where(instruments: {id: user.instrument_ids}).distinct }

  def has_user?(user)
    !self.instruments.where(user: user).empty?
  end
  
  def instruments_by_user(user)
    self.instruments.where(user: user)
  end
end
