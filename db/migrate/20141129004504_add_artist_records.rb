class AddArtistRecords < ActiveRecord::Migration
  def change
    create_table :artists_records, id: false do |t|
      t.belongs_to :artist
      t.belongs_to :record
    end
  end
end
