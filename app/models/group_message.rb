class GroupMessage < ApplicationRecord
  belongs_to :group
  belongs_to :user
  # Pour gérer les fichiers attachés (optionnel, si tu veux ActiveStorage)
  # has_one_attached :file
end
