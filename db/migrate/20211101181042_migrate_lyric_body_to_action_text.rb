class MigrateLyricBodyToActionText < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :lyrics, :body, :body_old
    Lyric.all.each do |lyric|
      lyric.update_attribute(:body, simple_format(lyric.body_old))
    end
    remove_column :lyrics, :body_old
  end
end
