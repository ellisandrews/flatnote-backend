class User < ApplicationRecord
    has_many :notes
    validates :username, { presence: true, uniqueness: { case_sensitive: false } }
    has_secure_password
end
