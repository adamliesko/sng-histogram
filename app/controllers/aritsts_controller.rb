class ArtistsController < ActionController::Base

  respond_to :json
  def show

  end

  def index
    @artists = Artist.all
    respond_to do |format|
      format.json { render json: @artists}
    end
  end

end
