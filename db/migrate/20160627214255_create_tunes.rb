class CreateTunes < ActiveRecord::Migration[5.0]
  def change
    create_table :tunes do |t|
      t.string :name
      t.string :key

      t.timestamps
    end
  end
end
