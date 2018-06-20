class AddBooksCountToEditor < ActiveRecord::Migration[5.2]
  def change
    add_column :editors, :books_count, :integer
  end
end
