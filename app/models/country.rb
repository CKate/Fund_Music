class Country < ActiveRecord::Base
	has_many :voteartists
	validates :country_name, presence: true, uniqueness: true
end
