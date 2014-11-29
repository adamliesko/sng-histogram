class ArtistRecord < ActiveRecord::Base
  belongs_to :artist
  belongs_to :record

end
