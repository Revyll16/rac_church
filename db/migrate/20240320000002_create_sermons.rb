class CreateSermons < ActiveRecord::Migration[7.1]
  def change
    create_table :sermons do |t|
      t.string :title, null: false
      t.string :speaker, null: false
      t.date :date, null: false
      t.text :description, null: false
      t.string :audio_url
      t.string :video_url
      t.text :scripture_references

      t.timestamps
    end
  end
end 