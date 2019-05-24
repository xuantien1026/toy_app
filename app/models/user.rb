class User < ApplicationRecord
    has_many :microposts
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before_save { self.email.downcase! }
    validates :name,  presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 255},
                      format: { with: VALID_EMAIL_REGEX, message: "must be of the form someone@something.com" },
                      uniqueness: { case_sensitive: false }
end
