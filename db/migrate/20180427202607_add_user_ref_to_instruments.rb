class AddUserRefToInstruments < ActiveRecord::Migration[5.0]
  def change
    add_reference :instruments, :user, foreign_key: true
  end
end
