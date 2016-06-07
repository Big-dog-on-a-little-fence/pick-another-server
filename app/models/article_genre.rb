class ArticleGenre < ActiveRecord::Base
  belongs_to :article
  belongs_to :genre
end