class Artist < ActiveRecord::Base
	has_many :voteartists, dependent: :destroy
	validates :artist_name, uniqueness: true
	validates :minimum_donation, :artist_name, :target_amount, presence: true
	validate :must_have_valid_video
	validate :target_greater_than_minumum
	validate :target_date_greater_than
	
	def must_have_valid_video
		unless latest_single.include?("<iframe")
			errors.add(:latest_single, "must include an iframe tag.")
		end
	end
	
	def target_greater_than_minumum
		if target_amount < minimum_donation
			errors.add(:target_amount, "must be greater than minimum donation.")
		end
	end
	
	def target_date_greater_than #target date greater than 20 days
		if target_date <= DateTime.now.to_date + 20 
			errors.add(:target_date, "must be greater than the date created (At least 20 days.")
		end
	end
	
	def self.search(query)
		where("artist_name LIKE ?", "%#{query}%")
	end
end
