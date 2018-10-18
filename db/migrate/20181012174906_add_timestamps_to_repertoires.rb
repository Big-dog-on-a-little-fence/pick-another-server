class AddTimestampsToRepertoires < ActiveRecord::Migration[5.0]
  def change
    # add new column but allow null values
    add_timestamps :repertoires, null: true 
  end
end
