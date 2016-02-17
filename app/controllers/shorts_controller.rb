class ShortsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  def index
    @shorts = Short.all
  end

  def show
  end

	# GET /shorts/new
	def new
		@short = Short.new
	end

  def edit
  end

  # POST /shorts
  def create
    @short = Short.new(short_params)

    respond_to do |format|
      if @short.save
        format.html { render action: "show" }
      else
        format.html { render action: "new" }
      end
    end
    puts "Estoy creando2"
  end
  def destroy
      @short.destroy
      respond_to do |format|
        format.html { redirect_to short_url, notice: 'URL was successfully destroyed.' }
      end
    end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_url
    @short = Short.find(params[:id])
  end

  def short_params
      params.require(:short).permit(:long)
  end
end
