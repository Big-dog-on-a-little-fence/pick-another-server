class AddAuthorToTunes < ActiveRecord::Migration[6.1]
  def change
    add_column :tunes, :author, :string
  end
end
