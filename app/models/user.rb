class User < ApplicationRecord
    has_many :dogs
    has_many :breeds, through: :dogs
end
