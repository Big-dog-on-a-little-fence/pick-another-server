class CreateTunings < ActiveRecord::Migration[5.0]
  def change
    create_table :tunings do |t|
      t.string :notes
      t.string :name
      t.integer :instrument_type

      t.timestamps
    end
  end
end
