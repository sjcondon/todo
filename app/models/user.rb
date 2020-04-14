class User < ActiveRecord::Base
    has_secure_password
    has_many :todo_items
    has_many :todo_lists, through: :todo_items
    # validate_presence_of :email :password
     validates_uniqueness_of :email
     
end
