class Article < ApplicationRecord
  belongs_to :user
  # validates :title, presence: true, length: { minimum:3, maximum: 50 }
  # validates :key, presence: true, length: { minimum:1, maximum: 5 }
  # validates :instrument, presence: true, length: { minimum:2, maximum: 30 }
  # validates :description, presence: true, length: { minimum:10, maximum: 300 }
  # validates :user_id, presence: true
end
