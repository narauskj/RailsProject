class AddUserIdToTransfers < ActiveRecord::Migration
  def change
    add_column :transfers, :user_id, :string
  end
end
