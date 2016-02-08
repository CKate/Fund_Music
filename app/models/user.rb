class User < ActiveRecord::Base
	has_many :voteartists, dependent: :destroy
	validates :first_name, :last_name, :user_name, :email, :password_digest, presence: true
	validates :user_name, :email, uniqueness: true
	has_secure_password
end
