class Artist < ActiveRecord::Base
  #has_many :records, :through => :artist_records
  has_and_belongs_to_many :records
  has_many :eras

  def records_count
    records.count
  end
end
