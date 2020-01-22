class User < ApplicationRecord
    has_many :dogs
    has_many :breeds, through: :dogs
    has_secure_password
    validates :username, uniqueness: true
    scope :qualified, -> {where qualification: !nil}
    accepts_nested_attributes_for :dogs, reject_if: proc{|attributes| attributes['name'].blank?}

    
    # def dogs_attributes=(dogs_attributes)

    #     dogs_attributes.each do |i, dog_attributes|
    #        if !dog_attributes.values.blank?
    #         self.dogs.build(dog_attributes)
    #        end 
          
    #     end
    # end

    
end
