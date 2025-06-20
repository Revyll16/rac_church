class Event < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  scope :upcoming, -> { where('date >= ?', Date.current).order(date: :asc) }
  scope :past, -> { where('date < ?', Date.current).order(date: :desc) }
end 