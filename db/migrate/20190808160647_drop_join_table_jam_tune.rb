class DropJoinTableJamTune < ActiveRecord::Migration[5.0]
  def change
    drop_join_table :jams, :tunes
  end
end
