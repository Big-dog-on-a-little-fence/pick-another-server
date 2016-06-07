class CreateArticleGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :article_genres do |t|
      t.integer :article_id
      t.integer :genre_id
    end
  end
end
