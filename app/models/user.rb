class User < ApplicationRecord
    has_many :dogs
    has_many :breeds, through: :dogs
    has_secure_password
    # scope :expert, => { where'Veterinarian' || 'Breeder' || 'Vet-tech'}

end
