class User < ActiveRecord::Base
    has_secure_password
    has_many :todo_items
    has_many :todo_lists, through: :todo_items
    validates :email, :presence => true
    validates :email, :uniqueness => true 

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.ui). first_or_create do |user|
            @user.provider = auth.provider
            @user.uid = auth.uid
            @user.email = auth.info.email
            @user.password = Devise.friendly_token [0.2] #this is equal to line 23
        end
    end

    def self.find_or_create_by_omniauth(auth_hash)
        oauth_email = auth_hash["info"]["email"]
        if @user = User.find_by(:email => oauth.email)
            return  @user
            
        else
            @user = User.create(:email => oauth.email, :password => SecureRandom.hex)
        end
     end
 