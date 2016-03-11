class Country < ActiveRecord::Base
	has_many :voteartists, dependent: :destroy
end
