class UpdateEventsStructure < ActiveRecord::Migration[7.1]
  def change
    # Supprimer la colonne location
    remove_column :events, :location, :string

    # Ajouter la colonne date
    add_column :events, :date, :date
  end
end