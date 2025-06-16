class Sermon < ApplicationRecord
  validates :title, presence: true
  validates :speaker, presence: true
  validates :date, presence: true
  validates :description, presence: true

  scope :recent, -> { order(date: :desc) }
end 