class AddFileNameToRecord < ActiveRecord::Migration
  def change
    add_column :records, :file_name, :string
  end
end
