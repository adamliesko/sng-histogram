class ErasController < ActionController::Base

  respond_to :json

  def show

  end

  def aggregated
    @aggregated_era = Era.where(date_from: nil, date_to: nil, artist_id: params[:id]).first
    puts @aggregated_era
    respond_to do |format|
      format.json { render json:  @aggregated_era}
    end
  end

  def selected_period
    @era = Era.where(date_from: nil, date_to: nil, artist_id: params[:id]).first
    puts @era
    respond_to do |format|
      format.json { render json:  @aggregated_era}
    end
  end

  def index
    @eras = Era.where(artist_id: params[:artist_id])

    respond_to do |format|
      format.json { render json: @eras.to_json}
    end
  end

end
