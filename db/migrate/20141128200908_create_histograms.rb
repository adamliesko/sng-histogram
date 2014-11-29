class CreateHistograms < ActiveRecord::Migration
  def change
    create_table :histograms do |t|

      t.timestamps
    end
  end
end
