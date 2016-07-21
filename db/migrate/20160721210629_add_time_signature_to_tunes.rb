class AddTimeSignatureToTunes < ActiveRecord::Migration[5.0]
  def change
    add_column :tunes, :time_signature, :string
  end
end
