namespace :computing do
  task :compute_histograms => :environment do

    Artist.find_each do |artist|

      color_counts = Hash.new { |hash, key| hash[key] = 0 }
      global_histogram = Hash.new { |hash, key| hash[key] = 0 }

      artist.records.each do |record|
        record.histogram.each do |color, value|
          if value > 0
            color_counts[color] += 1
            global_histogram[color] += value
          end
        end

        global_histogram.each_key do |color|
          global_histogram[color] /= color_counts[color] if color_counts[color] != 0
        end
      end

      era = Era.new(artist_id: artist.id, date_from: nil, date_to: nil, histogram: global_histogram)
      if era.save
        puts era
      else
        puts "Error on:\n artist:#{artist.name}\n - #{record.id}"
      end
    end

  end

  task :dominant_color => :environment do
    Artist.find_each do |artist|
      artist.dominant_color=artist.compute_dominant_color
      puts artist.dominant_color
      artist.save
    end
  end
end
