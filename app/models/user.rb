class User < ActiveRecord::Base
    has_secure_password
    has_many :todo_items
    has_many :todo_lists, through: :todo_items
    validates :email, :presence => true
    validates :email, :uniqueness => true 

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["nickname"]).first_or_create do |user|
            user.password = SecureRandom.hex

        end
     end
    end
 