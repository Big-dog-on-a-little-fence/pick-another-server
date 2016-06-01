class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :key
      t.string :instrument
      t.text :description

      t.timestamps
    end
  end
end
