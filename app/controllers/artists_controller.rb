class ArtistsController < ActionController::Base

  respond_to :json

  def show

  end

  def index
    @artists = Artist.all.order(:name)
    puts @artists.to_json(:methods => :records_count)
    respond_to do |format|
      format.json { render json: @artists.to_json(:methods => :records_count)}
    end
  end

end
