class User < ApplicationRecord
    has_many :dogs
    has_many :breeds, through: :dogs
    has_secure_password
    scope :qualified, -> {where qualification: !nil}
    accepts_nested_attributes_for :dogs

    
    

    
end
