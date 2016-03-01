class User < ActiveRecord::Base
	has_many :voteartists
	validates :first_name, :last_name, :user_name, :email, :password_digest, presence: true
	validates :user_name, :email, uniqueness: true
	has_secure_password
	
	def age(dob)
		now = Time.now.utc.to_date
		now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
	end
	
	def change_balance(amount_paid)
		balance = balance - amount_paid
		balance
	end
end
