class AddChordListToProgressions < ActiveRecord::Migration[5.0]
  def change
    add_column :progressions, :chord_list, :string
  end
end
