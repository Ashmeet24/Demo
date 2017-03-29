class User < ApplicationRecord
#has_secure_password
has_many :user_events 
    has_many :events
    has_many :posts

end
