class Record < ActiveRecord::Base

  before_create :build_attributes

  def build_attributes
    attrs=Hash.from_xml(self.xml_body)["metadata"]["dc"]
    return if attrs.is_a?(String)
    puts attrs
    attrs.each do |k, v|
      send("#{k.tr('.','_')}=", v) unless k.include?('xmlns')
    end
  end
end