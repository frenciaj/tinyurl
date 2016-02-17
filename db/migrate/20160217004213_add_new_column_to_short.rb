class AddNewColumnToShort < ActiveRecord::Migration
  def change
    add_column :shorts, :tiny, :string
  end
end
