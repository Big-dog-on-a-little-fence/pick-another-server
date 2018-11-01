class AddRepertoireToInstrumentTunes < ActiveRecord::Migration[5.0]
  def change
    add_reference :instrument_tunes, :repertoire, foreign_key: true
  end
end
