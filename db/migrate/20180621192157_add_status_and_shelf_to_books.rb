class AddStatusAndShelfToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :status, :integer
    add_column :books, :shelf, :integer
  end
end
