class User < ApplicationRecord
    validates :password, presence: true
    has_secure_password
end
