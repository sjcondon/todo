class User < ActiveRecord::Base
    has_secure_password
    has_many :todo_items
    has_many :todo_lists, through: :todo_items
    validates :email, :presence => true
    validates :email, :uniqueness => true 
     
end
 