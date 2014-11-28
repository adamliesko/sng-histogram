class AddFieldsToRecord < ActiveRecord::Migration
  def change
    add_column :records, :artist_ids, :integer , array: true, default: []
    add_column :records, :histogram, :integer , array: true, default: []
  end
end
