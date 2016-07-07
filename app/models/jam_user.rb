class JamUser < ActiveRecord::Base
  belongs_to :jam
  belongs_to :user
end