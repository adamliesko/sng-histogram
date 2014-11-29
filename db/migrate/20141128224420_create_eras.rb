class CreateEras < ActiveRecord::Migration
  def change
    create_table :eras do |t|

      t.integer :date_from, null: true
      t.integer :date_to, null: true
      t.json :era

      t.timestamps
    end
  end
end
