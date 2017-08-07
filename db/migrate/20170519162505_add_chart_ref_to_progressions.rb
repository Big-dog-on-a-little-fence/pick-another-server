class AddChartRefToProgressions < ActiveRecord::Migration[5.0]
  def change
    add_reference :progressions, :chart, foreign_key: true
  end
end
