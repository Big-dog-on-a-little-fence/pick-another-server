class AddTuneRefToCharts < ActiveRecord::Migration[5.0]
  def change
    add_reference :charts, :tune, foreign_key: true
  end
end
