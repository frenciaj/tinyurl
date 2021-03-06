class ShortsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]
   before_action :set_url_tiny, only: :show_tiny

  def index
    @shorts = Short.all

  end

  def show
    redirect_to @short.long
  end

  def show_tiny
    redirect_to @short.long
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
    urlgenerator
    respond_to do |format|
      if @short.save
        format.html { render action: "show" }
      else
        format.html { render action: "new" }
      end
    end
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

  def set_url_tiny
  @short = Short.find_by_tiny(params[:tiny])
  end

  def short_params
      params.require(:short).permit(:long)
  end
def urlgenerator
  value = ('0'..'9').to_a + %w(b c d f g h j k l m n p q r s t v w x y z) + %w(B C D F G H J K L M N P Q R S T V W X Y Z - _)
  @short.tiny = value.sample(6).join
end

end
