class Country < ActiveRecord::Base
	has_many :voteartists, dependent: :destroy
	validates :country_name, presence: true, uniqueness: true
end
