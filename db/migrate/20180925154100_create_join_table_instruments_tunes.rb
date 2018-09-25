class CreateJoinTableInstrumentsTunes < ActiveRecord::Migration[5.0]
  def change
    create_join_table :instruments, :tunes do |t|
      t.index [:instrument_id, :tune_id]
      t.index [:tune_id, :instrument_id]
    end
  end
end
