class VoteartistsController < ApplicationController
  before_action :set_voteartist, only: [:show, :edit, :update, :destroy]

  # GET /voteartists
  # GET /voteartists.json
  def index
    @voteartists = Voteartist.all
  end

  # GET /voteartists/1
  # GET /voteartists/1.json
  def show
  end

  # GET /voteartists/new
  def new
    @voteartist = Voteartist.new
  end

  # GET /voteartists/1/edit
  def edit
  end

  # POST /voteartists
  # POST /voteartists.json
  def create
    @voteartist = Voteartist.new(voteartist_params)

    respond_to do |format|
      if @voteartist.save
        format.html { redirect_to @voteartist, notice: 'Voteartist was successfully created.' }
        format.json { render :show, status: :created, location: @voteartist }
      else
        format.html { render :new }
        format.json { render json: @voteartist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voteartists/1
  # PATCH/PUT /voteartists/1.json
  def update
    respond_to do |format|
      if @voteartist.update(voteartist_params)
        format.html { redirect_to @voteartist, notice: 'Voteartist was successfully updated.' }
        format.json { render :show, status: :ok, location: @voteartist }
      else
        format.html { render :edit }
        format.json { render json: @voteartist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voteartists/1
  # DELETE /voteartists/1.json
  def destroy
    @voteartist.destroy
    respond_to do |format|
      format.html { redirect_to voteartists_url, notice: 'Voteartist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voteartist
      @voteartist = Voteartist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voteartist_params
      params.require(:voteartist).permit(:artist_id, :user_id, :integer, :country_id, :amount_paid)
    end
end
