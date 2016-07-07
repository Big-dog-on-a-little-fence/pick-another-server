class CreateJamUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :jam_users do |t|
      t.integer :jam_id
      t.integer :user_id
    end
  end
end
