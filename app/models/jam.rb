class Jam < ApplicationRecord
  has_many :jam_users
  has_many :users, through: :jam_users
  has_many :tunes, -> { distinct }, through: :users
  has_many :comments, as: :commentable
  
  ## TODO: validations
  
  def tunes_everyone_knows
    tunes_includes = [:genres, :sources, charts: [progressions: :measures]]
    tunes_intersection = self.tunes.includes(tunes_includes)
    self.users.each do |user|
      tunes_intersection &= user.tunes.includes(tunes_includes)
    end
    tunes_intersection
  end

end
