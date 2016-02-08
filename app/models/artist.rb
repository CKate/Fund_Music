class Artist < ActiveRecord::Base
	has_many :voteartists, dependent: :destroy
	
	validate :must_have_valid_video
	def must_have_valid_video
		unless latest_single.include?("<iframe")
			errors.add(:trailer, "Must include an iframe tag")
		end
	end
end
