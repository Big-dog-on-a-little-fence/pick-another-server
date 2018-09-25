class AddInstrumentToRepertoires < ActiveRecord::Migration[5.0]
  def change
    add_reference :repertoires, :instrument, foreign_key: true
  end
end
