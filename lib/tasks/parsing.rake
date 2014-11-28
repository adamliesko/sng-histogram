namespace :parsing do
  task :parse_metadata => :environment do
    # require 'oai'
    require 'rexml/document'
    require 'open-uri'
    Dir.foreach('/Users/Adam/sng-histogram/europeana-nahlady') do |image|
      begin
        next if image == '.' or image== '..'
        id=image.split('--')[1]

        http = Curl.get("http://www.webumenia.sk/oai-pmh/?verb=GetRecord&metadataPrefix=oai_dc&identifier=SVK%3ASNG.#{id}")

        Record.new(attrs: Hash.from_xml(http.body_str.to_s).to_json).save

      rescue
        next
      end


    end

  end

  task :add_filenames_and_histogram => :environment do
    Dir.foreach("#{Rails.root}/europeana-nahlady") do |image|
      next if image == '.' or image== '..'
      id="SVK:SNG.#{image.split('--')[1]}"
      r=Record.where("'#{id}' = ANY (identifier)").first
      if r
        img = Magick::Image.read("#{Rails.root}/europeana-nahlady/#{image}").first
        #gets color histogram (quantize => 256 colors)
        histogram=img.quantize.color_histogram
        r.file_name = image
        r.histogram = histogram.values
        puts r
        r.save
      end
    end
  end

  task :map_artist_ids => :environment do
    Record.find_each do |record|
      artists =[]
      record.creator.each do |name|
        artists << Artist.find_or_create_by(name: name).id
      end
      record.artist_ids = artists
      record.save
    end
  end

end