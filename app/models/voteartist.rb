class Voteartist < ActiveRecord::Base
	belongs_to :user
	belongs_to :artist
	belongs_to :country
	
	
	
	def must_be_greater_than_minimum
		if amount_paid < artist.minimum_donation && user.balance < amount_paid
			errors.add(:base, "Your balance is below the minimum donation.")
		end
	end
	
	validate :must_be_greater_than_minimum
end
