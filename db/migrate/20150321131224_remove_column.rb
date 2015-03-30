class RemoveColumn < ActiveRecord::Migration
  def change
    change_column :assets, :priority, :string
  end
end
