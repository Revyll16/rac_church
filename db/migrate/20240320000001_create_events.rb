class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.text :description, null: false
      t.string :location
      t.string :status, default: 'upcoming'

      t.timestamps
    end
  end
end 