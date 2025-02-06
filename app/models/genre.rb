class Genre < ApplicationRecord
    has_many :article_genres
    has_many :articles, through: :article_genres
    has_many :tune_genres
    has_many :tunes, through: :tune_genres
    has_rich_text :description
    
    validates :name, presence: true, length: {minimum: 3, maximum: 25}
    validates_uniqueness_of :name
end
