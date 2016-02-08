class Voteartist < ActiveRecord::Base
	belongs_to :user
	belongs_to :artist
	belongs_to :country
	
	validates :amount_paid, :numericality =>{ :greater_than => 4}
end
