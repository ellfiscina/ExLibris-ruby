class AddPositionToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :position, :integer
  end
end
