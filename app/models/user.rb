class User < ApplicationRecord
    has_many :microposts
    validates :name, presence: true
    validates :email, presence: true, format: { with: /[a-zA-Z0-9_]+@[a-z]+\.[a-z]+/}
end
