class Era < ActiveRecord::Base
  belongs_to :artist
  has_one :histogram
end
