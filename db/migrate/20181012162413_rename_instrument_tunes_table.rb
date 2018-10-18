class RenameInstrumentTunesTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :instrument_tune_tmps, :instrument_tunes
  end
end
