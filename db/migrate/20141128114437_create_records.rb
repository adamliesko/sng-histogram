class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.json :attrs
      t.string :title, array: true, default: []
      t.string :title_translated, array: true, default: []
      t.text :subject, array: true, default: []
      t.text :extent,  array: true, default: []
      t.string :creator, array: true, default: []
      t.string :type, array: true, default: []
      t.string :created, array: true, default: []
      t.string :identifier, array: true, default: []
      t.string :provenance, array: true, default: []
      t.text :description, array: true, default: []
      t.string :format, array: true, default: []
      t.string :format_medium, array: true, default: []
      t.string :subject_place, array: true, default: []
      t.timestamps
    end
  end
end
