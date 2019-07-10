class User < ApplicationRecord
  before_save {email.downcase!}

  VALID_EMAIL_REGEX = Settings.validation_user.email_user

  validates :name,  presence: true, length: { maximum: Settings.validation_user.name_user_max }
  validates :email, presence: true, length: { maximum: Settings.validation_user.password_user_max },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: Settings.validation_user.password_user_min }

  has_secure_password
end
