class CreateGroupMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :group_messages do |t|
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.string :message_type
      t.string :file_url

      t.timestamps
    end
  end
end
