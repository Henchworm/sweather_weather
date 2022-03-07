class User < ApplicationRecord
  
  validates :email,
          :format => { with: URI::MailTo::EMAIL_REGEXP },
          :presence => {message: "can't be blank"},
          :uniqueness => true
  validates :password_digest,
          :presence => {message: "can't be blank"}

  has_secure_password

end
