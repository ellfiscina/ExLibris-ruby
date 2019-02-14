class AddDatesToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :birth_date, :date
    add_column :authors, :death_date, :date
  end
end
