class Tune < ApplicationRecord
  has_many :repertoires
  has_many :users, through: :repertoires
  validates :name, presence: true, :uniqueness => {:case_sensitive => false}, length: { minimum:3, maximum: 50 }
  validates :key, presence: true, length: { minimum:1, maximum: 5 }
end
