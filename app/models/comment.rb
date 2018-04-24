class Comment < ApplicationRecord
  include PublicActivity::Common
  
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :user
  
  validates :body, presence: true
end
