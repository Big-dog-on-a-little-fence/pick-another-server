class CreateMeasures < ActiveRecord::Migration[5.0]
  def change
    create_table :measures do |t|
      t.string :body
      t.references :progression, foreign_key: true

      t.timestamps
    end
  end
end
