class CreateJoinTableListsBooks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :lists, :books do |t|
      t.index :list_id
      t.index :book_id
    end
  end
end
