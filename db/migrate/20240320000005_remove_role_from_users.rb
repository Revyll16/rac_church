class RemoveRoleFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :role, :string if column_exists?(:users, :role)
  end
end 