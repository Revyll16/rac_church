class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description
      t.string :meeting_day
      t.time :meeting_time
      t.string :location
      t.boolean :active, default: true
      t.references :leader, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :groups, :name, unique: true
  end
end 