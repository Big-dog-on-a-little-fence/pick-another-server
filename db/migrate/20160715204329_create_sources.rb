class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :version
      t.string :link
      t.text :description
      t.references :tune, foreign_key: true

      t.timestamps
    end
  end
end
