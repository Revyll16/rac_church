class Group < ApplicationRecord
  # Associations
  has_many :group_memberships, dependent: :destroy
  has_many :members, through: :group_memberships, source: :user
  has_many :group_messages, dependent: :destroy

  has_one_attached :image

  # Validations
  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end 