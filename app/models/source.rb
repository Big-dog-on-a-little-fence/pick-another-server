class Source < ApplicationRecord
  belongs_to :tune
  validates :version, presence: true, :uniqueness => {:case_sensitive => false}, length: { minimum:3, maximum: 50 }
  validates :link, presence: true
  ## validates_format_of :link, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
