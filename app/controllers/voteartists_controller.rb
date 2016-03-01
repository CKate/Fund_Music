class VoteartistsController < ApplicationController
	before_filter :authorise
	def create
		@artist = Artist.find params[:artist_id]
		@voteartist = @artist.voteartists.new(voteartist_params)
		@voteartist.user_id = @current_user.id
		#@voteartist.user.balance = @voteartist.user.change_balance(@voteartist.amount_paid)
		@voteartist.save
		
		if @voteartist.errors.any?
			render 'artists/show'
		else
			redirect_to @artist
		end
		
	end
	
	private
	def voteartist_params
		params.require(:voteartist).permit(:artist_id, :user_id, :country_id, :amount_paid)
	end
	
end
