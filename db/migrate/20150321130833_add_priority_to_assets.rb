class AddPriorityToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :priority, :integer
  end
end
