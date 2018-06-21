class User < ActiveRecord::Base

    validates :name,  presence: true, length: { maximum: 50 }
                      
    has_secure_password

  def hash_password(password)
    BCrypt::Password.create(password).to_s
  end
  
  def test_password(password, hash)
    BCrypt::Password.new(hash) == password
  end
end
