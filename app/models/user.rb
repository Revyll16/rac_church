class User < ApplicationRecord
  has_secure_password

  # Rôles disponibles
  ROLES = %w[admin member].freeze

  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }

  before_save :downcase_email

  # Méthodes de rôle
  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == 'admin'
  end

  def member?
    role == 'member'
  end

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
