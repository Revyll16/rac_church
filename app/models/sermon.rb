class Sermon < ApplicationRecord
  has_one_attached :audio
  has_one_attached :video
  validates :title, presence: true
  validates :speaker, presence: true
  validates :date, presence: true
  validates :description, presence: true

  scope :recent, -> { order(date: :desc) }
end 