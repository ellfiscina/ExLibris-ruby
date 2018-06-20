class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :isbn
      t.string :title
      t.string :subtitle
      t.integer :year
      t.integer :pages
      t.integer :edition
      t.string :language
      t.references :editor, foreign_key: true
      t.references :author, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
