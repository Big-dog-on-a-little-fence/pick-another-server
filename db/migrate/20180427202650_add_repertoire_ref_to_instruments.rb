class AddRepertoireRefToInstruments < ActiveRecord::Migration[5.0]
  def change
    add_reference :instruments, :repertoire, foreign_key: true
  end
end
