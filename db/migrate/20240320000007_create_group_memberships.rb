class CreateGroupMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :group_memberships do |t|
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :role, default: 'member'
      t.date :joined_at
      t.date :left_at
      t.text :notes

      t.timestamps
    end

    add_index :group_memberships, [:group_id, :user_id], unique: true
  end
end 