class Jam < ApplicationRecord
  has_many :jam_users
  has_many :users, through: :jam_users
  ## TODO: validations
end
