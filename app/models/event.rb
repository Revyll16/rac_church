class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true

  scope :upcoming, -> { where('date >= ?', Date.current).order(date: :asc) }
  scope :past, -> { where('date < ?', Date.current).order(date: :desc) }
end 