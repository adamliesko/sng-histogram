class Record < ActiveRecord::Base

  self.inheritance_column = :_type_disabled
  before_create :build_attributes

  def build_attributes
    hash= attrs["OAI_PMH"]["GetRecord"]["record"]["metadata"]["dc"]
    return if hash.is_a?(String)
    puts hash
    hash.each do |k, v|
      send("#{k.tr('.','_')}=", v) unless k.include?('xmlns')
    end
  end
end