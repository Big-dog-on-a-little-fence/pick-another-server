class AddTypeToInstruments < ActiveRecord::Migration[5.0]
  def change
    add_column :instruments, :type, :string
  end
end
