class CreateTuneGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :tune_genres do |t|
      t.integer :tune_id
      t.integer :genre_id
    end
  end
end
