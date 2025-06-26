class User < ApplicationRecord
  ROLES = %w[admin member]
  rolify
  has_secure_password

  # Associations
  has_many :group_memberships
  has_many :groups, through: :group_memberships
  has_many :led_groups, class_name: 'Group', foreign_key: 'leader_id'

  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :first_name, presence: true
  validates :last_name, presence: true

  before_save :downcase_email

  # Méthodes de rôle
  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    has_role?(:admin)
  end

  def member?
    has_role?(:member)
  end


  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end

