class FixColumnName < ActiveRecord::Migration
  def change
   	rename_column :transfers, :user_id, :employee_id
  end
end
