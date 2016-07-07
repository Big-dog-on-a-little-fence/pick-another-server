class TuneGenre < ActiveRecord::Base
  belongs_to :tune
  belongs_to :genre
end