class DropRepertoires < ActiveRecord::Migration[5.0]
  def change
    drop_table :repertoires
  end
end
