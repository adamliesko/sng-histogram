class AddArtistIdToEra < ActiveRecord::Migration
  def change
    add_column :eras, :artist_id, :integer
  end
end
