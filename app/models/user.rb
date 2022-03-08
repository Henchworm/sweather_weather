class User < ApplicationRecord

  validates :email,
    :format => { with: URI::MailTo::EMAIL_REGEXP },
    :presence => {message: "can't be blank"},
    :uniqueness => true
  validates :password_digest,
    :presence => {message: "can't be blank"}

  has_secure_password

  has_secure_token :api_key

  before_create :set_api_key

  private
  def set_api_key
    self.api_key = SecureRandom.hex(10)
  end
end
