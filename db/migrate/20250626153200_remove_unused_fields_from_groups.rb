class RemoveUnusedFieldsFromGroups < ActiveRecord::Migration[7.1]
  def change
    remove_column :groups, :leader_id, :bigint
    remove_column :groups, :meeting_day, :string
    remove_column :groups, :meeting_time, :time
    remove_column :groups, :location, :string
    remove_column :groups, :active, :boolean
  end
end
