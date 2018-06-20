class AddBooksCountToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :books_count, :integer
  end
end
