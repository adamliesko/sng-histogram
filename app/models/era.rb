class Era < ActiveRecord::Base
  belongs_to :artist

  #should get rgb values

  def images_urls
    urls=[]
    artist.records.each do |r|
      urls << r.identifier.select {|x| x.include?("http") && !x.include?("IMAGE")}
    end
    urls.flatten
  end

  def self.hexify_color(values)
    res = ''
    values.each do |val|
      if val < 15
        res << '0'
        res << val.to_s(16)
      else
        res << val.to_s(16)
      end
    end
    res
  end
end
