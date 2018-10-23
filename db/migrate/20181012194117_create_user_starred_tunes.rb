class CreateUserStarredTunes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_starred_tunes do |t|
      t.belongs_to :user, :null => false, :index => true
      t.belongs_to :tune, :null => false, :index => true
      t.string :goal
      t.timestamps
    end
  end
end
