class AddIndicesAndColumns < ActiveRecord::Migration
  def change
    add_index :artists, :name, :name => 'name_idx'
    add_column :records, :artist_id, :integer
    add_index :records, :artist_id, :name => 'fk_artist_id'
    add_column :histograms, :artist_id, :integer
    add_index :histograms, :artist_id, :name => 'fk_artist_id_2'
  end
end
