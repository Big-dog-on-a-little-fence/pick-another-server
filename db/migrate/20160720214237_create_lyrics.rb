class CreateLyrics < ActiveRecord::Migration[5.0]
  def change
    create_table :lyrics do |t|
      t.string :version
      t.text :body
      t.references :tune, foreign_key: true

      t.timestamps
    end
  end
end
