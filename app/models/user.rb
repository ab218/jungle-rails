class User < ActiveRecord::Base

    before_validation :downcase_email
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    validates :first_name,  presence: true, length: { maximum: 20 }
    validates :last_name,  presence: true, length: { maximum: 20 }
    validates :password, presence: true, length: { minimum: 5, maximum: 20 }
    validates :email, uniqueness: { case_sensitive: false }, presence: true, length: { maximum: 20 }

    has_many :reviews
    
    has_secure_password

    def downcase_email
        self.email = email.downcase if email.present?
    end

    def self.authenticate_with_credentials(email, password)
        user = User.find_by(email: email)
        if (user != nil)
            user.authenticate(password)
        else
            return false
        end
    end
end
