class AddHistogramToEra < ActiveRecord::Migration
  def change
    add_column :eras, :histogram, :json
  end
end
