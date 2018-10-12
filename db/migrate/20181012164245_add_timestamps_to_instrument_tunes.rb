class AddTimestampsToInstrumentTunes < ActiveRecord::Migration[5.0]
  def change
    # add new column but allow null values
    add_timestamps :instrument_tunes, null: true 
  end
end
