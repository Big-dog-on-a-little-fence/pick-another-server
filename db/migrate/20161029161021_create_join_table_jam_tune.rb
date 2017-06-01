class CreateJoinTableJamTune < ActiveRecord::Migration[5.0]
  def change
    create_join_table :jams, :tunes do |t|
      t.index :jam_id
      t.index :tune_id
    end
  end
end