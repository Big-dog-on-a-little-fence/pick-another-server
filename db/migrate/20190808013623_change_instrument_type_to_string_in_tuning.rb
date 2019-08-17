class ChangeInstrumentTypeToStringInTuning < ActiveRecord::Migration[5.0]
  def change
    change_column :tunings, :instrument_type, :string
  end
end
