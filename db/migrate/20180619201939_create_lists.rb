class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :year
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
