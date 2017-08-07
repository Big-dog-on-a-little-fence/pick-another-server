class CreateProgressions < ActiveRecord::Migration[5.0]
  def change
    create_table :progressions do |t|
      t.integer :part_number

      t.timestamps
    end
  end
end
