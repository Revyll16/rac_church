class GroupMessage < ApplicationRecord
  belongs_to :group
  belongs_to :user
  # Pour gérer les fichiers attachés (optionnel, si tu veux ActiveStorage)
  has_one_attached :file # Permet l'upload de tout type de fichier

  validate :content_or_file_present

  private

  def content_or_file_present
    if content.blank? && !file.attached?
      errors.add(:base, "Le message ne peut pas être vide.")
    end
  end
end
