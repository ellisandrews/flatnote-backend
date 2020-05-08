class User < ApplicationRecord
    has_many :notes
    validates :username, { presence: true, uniqueness: { case_sensitive: false } }
    has_secure_password

    validates :username, length: { minimum: 1 }
    validates :password, length: { minimum: 8 }

    before_save :downcase_username
    before_save :strip_username

    private

    def downcase_username
        self.username.downcase!
    end

    def strip_username
        # Remove all leading and trailin whitespace
        self.username.strip!
    end

end
