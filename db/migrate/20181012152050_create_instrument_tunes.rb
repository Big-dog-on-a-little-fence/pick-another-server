class CreateInstrumentTunes < ActiveRecord::Migration[5.0]
  def up
    create_table :instrument_tune_tmps do |t|
      t.belongs_to :instrument, :null => false, :index => true
      t.belongs_to :tune, :null => false, :index => true
    end

    # Now populate it with a SQL one-liner!
    execute "insert into instrument_tune_tmps(instrument_id,tune_id) select instrument_id,tune_id from instruments_tunes"

    # drop the old table (habtm)
    drop_table :instruments_tunes
  end

  def down
    # This leaves the id and timestamps fields intact
    rename_table :instrument_tune_tmps, :instruments_tunes
  end
end
