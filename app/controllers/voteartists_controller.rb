class VoteartistsController < ApplicationController
	before_filter :authorise
	def index
		@artist = Artist.find params[:artist_id]
		redirect_to @artist;
	end
	
	def create
		@artist = Artist.find params[:artist_id]
		@voteartist = @artist.voteartists.new(voteartist_params)
		@voteartist.user_id = @current_user.id
		@artist.total_donation = @artist.total_donation + @voteartist.amount_paid
		@artist.save
		@voteartist.save
		if @voteartist.errors.any? || @voteartist.user.errors.any?
			render 'artists/show'
		else
			redirect_to @artist
			@voteartist.user.balance = @voteartist.user.changebalance(@voteartist.amount_paid)
			@voteartist.user.save
		end
		
	end
	
	private
	def voteartist_params
		params.require(:voteartist).permit(:artist_id, :user_id, :country_id, :amount_paid)
	end
	
end
