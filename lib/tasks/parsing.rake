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
    Dir.foreach("#{Rails.root}/Fulla-nahlady") do |image|
      next if image == '.' or image== '..'
      id="SVK:SNG.#{image.split('--')[1]}"
      r=Record.where("'#{id}' = ANY (identifier)").first
      if r
        img = Magick::Image.read("#{Rails.root}/Fulla-nahlady/#{image}").first
        #gets color histogram (quantize => 256 colors)

        histo_hash = {}

        img.quantize.color_histogram.each do |val|
          color = val.key.to_s.tr(' ', '').split(',')

          red = color[0].split('=')[1].to_i & 255
          green = color[1].split('=')[1].to_i & 255
          blue = color[2].split('=')[1].to_i & 255

          histo_hash[Era.hexify_color(red, green, blue)] = val.value
        end


        histogram= histo_hash.to_json
        r.file_name = image
        r.histogram = histogram
        puts r
        r.save
      end
    end
  end

  task :map_artist_ids => :environment do
    Record.find_each do |record|
      artists =[]
      record.creator.each do |name|
        artist = Artist.find_or_create_by(name: name)
        ArtistRecord.new(artist_id: artist.id, record_id: record.id).save
      end
      record.artist_ids = artists
      record.save
    end
  end

end