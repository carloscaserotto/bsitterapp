class User < ApplicationRecord
    #has_one :article
    has_one_attached :header_image   # Use has_one_attached for only one file allowed
    
    validates :email, presence: true, uniqueness: true, 
               format: { with: /\A[^@\s]+@[^@\s]+\z/, 
               message: 'Invalid email' }
    has_secure_password
end