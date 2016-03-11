class User < ActiveRecord::Base
	has_many :voteartists, :dependent => :destroy
	validates :first_name, :last_name, :user_name, :email, :password_digest, presence: true
	validates :user_name, :email, uniqueness: true
	has_secure_password
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	def age(dob)
		now = Time.now.utc.to_date
		now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
	end
	
	def changebalance(amount)
		if self.balance <= 0 || self.balance <= amount
			errors.add(:base, 'Balance is less than 0')
		else
			self.balance = self.balance.to_i - amount.to_i
		end
	end
end
