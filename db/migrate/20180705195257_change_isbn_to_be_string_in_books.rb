class ChangeIsbnToBeStringInBooks < ActiveRecord::Migration[5.2]
  def up
    change_column :books, :isbn, :string
  end
  def down
    change_column :books, :isbn, :integer
  end
end
