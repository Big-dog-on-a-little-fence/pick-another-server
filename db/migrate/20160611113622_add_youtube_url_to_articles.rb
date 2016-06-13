class AddYoutubeUrlToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :youtube_url, :string
  end
end
