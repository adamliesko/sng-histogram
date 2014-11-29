class Artist < ActiveRecord::Base
  #has_many :records, :through => :artist_records
  has_and_belongs_to_many :records
  has_many :eras



  def records_count
    records.count
  end



  def compute_dominant_color
    era = eras.where(date_from: nil, date_to:nil).first
    "##{era.histogram.sort_by {|_key, value| value}.last.first}"
  end
end