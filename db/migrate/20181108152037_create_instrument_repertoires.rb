class CreateInstrumentRepertoires < ActiveRecord::Migration[5.0]
  def change
    create_table :instrument_repertoires do |t|
      t.belongs_to :instrument, :null => false, :index => true
      t.belongs_to :repertoire, :null => false, :index => true
      t.timestamps
    end
  end
end
