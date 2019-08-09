class CreateTuneTunings < ActiveRecord::Migration[5.0]
  def change
    create_table :tune_tunings do |t|
      t.belongs_to :tune, index: true
      t.belongs_to :tuning, index: true
      t.timestamps
    end
  end
end
