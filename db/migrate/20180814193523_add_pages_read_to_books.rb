class AddPagesReadToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :pages_read, :integer
  end
end
