class AddTuningsToInstrumentTunes < ActiveRecord::Migration[5.0]
  def change
    add_column :instrument_tunes, :tunings, :text, default: [], array: true, null: false
  end
end
