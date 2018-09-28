class CreateInstruments < ActiveRecord::Migration[5.0]
  def change
    create_table :instruments do |t|
      t.string :family

      t.timestamps
    end
  end
end
