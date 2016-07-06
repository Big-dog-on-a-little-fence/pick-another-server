class CreateTuneCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :tune_categories do |t|
      t.integer :tune_id
      t.integer :category_id
    end
  end
end
