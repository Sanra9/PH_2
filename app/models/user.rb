class User < ApplicationRecord
    has_secure_password validations: false

    validates :name, :email,  :password,  presence: true
end
