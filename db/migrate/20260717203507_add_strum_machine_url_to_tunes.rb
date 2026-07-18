class AddStrumMachineUrlToTunes < ActiveRecord::Migration[6.1]
  def change
    add_column :tunes, :strum_machine_url, :string
  end
end
