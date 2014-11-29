class AddDominantColorToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :dominant_color, :string
  end
end
