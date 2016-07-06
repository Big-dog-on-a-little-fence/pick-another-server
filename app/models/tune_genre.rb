class ArticleGenre < ActiveRecord::Base
  belongs_to :tune
  belongs_to :genre
end