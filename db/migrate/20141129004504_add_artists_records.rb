class AddArtistsRecords < ActiveRecord::Migration
  def change
    create_table :artists_records do |t|
      t.integer :artist_id
      t.integer :record_id
    end
  end
end
