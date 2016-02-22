class VoteartistsController < ApplicationController
	before_filter :authorise
	
	def create
		@artist = Artist.find params[:artist_id]
			
		@voteartist = @artist.voteartists.new(voteartist_params)
		@voteartist.user_id = @current_user.id
		@voteartist.save
		
		respond_to do |format|
			format.html{redirect_to @artist}
		end
	end
	
	private
	def voteartist_params
		params.require(:voteartist).permit(:artist_id, :user_id, :country_id, :amount_paid)
	end
end
