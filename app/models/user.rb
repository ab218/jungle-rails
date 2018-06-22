class User < ActiveRecord::Base

    validates :name,  presence: true, length: { maximum: 50 }

    has_many :reviews
    
    has_secure_password
end
