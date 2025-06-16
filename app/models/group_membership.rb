class GroupMembership < ApplicationRecord
  # Associations
  belongs_to :group
  belongs_to :user

  # Validations
  validates :group_id, uniqueness: { scope: :user_id }
  validates :role, presence: true
  validates :joined_at, presence: true

  # Callbacks
  before_validation :set_joined_at, on: :create

  private

  def set_joined_at
    self.joined_at ||= Date.current
  end
end 