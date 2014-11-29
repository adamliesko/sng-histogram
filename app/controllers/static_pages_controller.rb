class StaticPagesController < ApplicationController
  def home
    @artists = Artist.all.order(:name)

    respond_to do |format|
      format.json { render json: @artists.to_json}
      format.html
    end
  end
end
