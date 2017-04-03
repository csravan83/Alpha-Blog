class User < ActiveRecord::Base
  has_many :articles
  before_save {self.email= email.downcase }
  validates :username, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3,maximum: 25}

  VALID_EMAIL_REGEX = /\A(\S+)@(.+)\.(\S+)\z/i

  validates :email, presence: true, length: {maximum: 200},
      uniqueness: {case_sensitive: false},
      format: { with: VALID_EMAIL_REGEX }

end
