class Artist < ActiveRecord::Base
	has_many :voteartists, dependent: :destroy
	validate :target_greater_than_minumum
	validate :must_have_valid_video
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
			errors.add(:target_date, "must be greater than the date created.")
		end
	end
end
