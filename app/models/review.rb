class Review < ActiveRecord::Base

    belongs_to :product
    belongs_to :user

    validates :user_id, presence: true
    validates :product_id, presence: true
    validates :description, presence: true, length: { maximum: 100 }
    validates :rating, presence: true


end
