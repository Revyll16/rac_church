class Group < ApplicationRecord
  # Associations
  belongs_to :leader, class_name: 'User'
  has_many :group_memberships
  has_many :members, through: :group_memberships, source: :user

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :meeting_day, presence: true
  validates :meeting_time, presence: true
  validates :location, presence: true

  # Scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  def to_s
    name
  end
end 