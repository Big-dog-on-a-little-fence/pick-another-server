class CreateRepertoires < ActiveRecord::Migration[5.0]
  def change
    create_table :repertoires do |t|
      t.integer :user_id
      t.integer :tune_id
    end
  end
end
