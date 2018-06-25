class User < ActiveRecord::Base

    validates :first_name,  presence: true, length: { maximum: 20 }
    validates :last_name,  presence: true, length: { maximum: 20 }
    validates :email, uniqueness: true, presence: true, length: { maximum: 20 }

    has_many :reviews
    
    has_secure_password
end
