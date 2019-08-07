class Jam < ApplicationRecord
  has_many :jam_users
  has_many :users, through: :jam_users
  has_many :tunes, -> { distinct }, through: :users
  has_many :comments, as: :commentable
  
  ## TODO: validations
end
