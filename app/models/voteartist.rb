class Voteartist < ActiveRecord::Base
	belongs_to :user
	belongs_to :artist
	belongs_to :country
	validate :amount_paid_less_than_donation
	validate :balance_less_than_amount_paid
	def amount_paid_less_than_donation
		self.errors.add(:amount_paid, ' is less than minimum donation.') if amount_paid < self.artist.minimum_donation
	end
	
	def balance_less_than_amount_paid
		self.errors.add(:base, 'Your balance is lower than the amount you want to pay.') if self.user.balance < amount_paid
	end
	
end
