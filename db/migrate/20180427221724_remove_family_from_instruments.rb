class RemoveFamilyFromInstruments < ActiveRecord::Migration[5.0]
  def change
    remove_column :instruments, :family, :string
  end
end
