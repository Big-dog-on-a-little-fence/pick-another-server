class Jam < ApplicationRecord
  has_many :jam_users
  has_many :users, through: :jam_users
  has_and_belongs_to_many :tunes
  ## TODO: validations
end
