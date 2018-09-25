class RemoveInstrumentFromRepertoires < ActiveRecord::Migration[5.0]
  def change
    remove_reference :repertoires, :instrument, foreign_key: true
  end
end
