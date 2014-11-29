namespace :computing do
  task :compute_histograms => :environment do

    #histograms = Artist.

    color_counts = Hash.new { |hash, key| hash[key] = 0 }
    global_histogram = Hash.new { |hash, key| hash[key] = 0 }

    Artist.find_each do |artist|
      artist.records.each do |record|
        record.histogram.each do |color, value|
          color_counts[color] += 1
          global_histogram[color] += value
        end

        global_histogram.each_key do |color|
          global_histogram[color] /= color_counts[color] if color_counts[color] != 0
        end
      end

      era = Era.new(artist_id: artist.id, date_from: nil, date_to: nil, histogram: global_histogram)
      if era.save
        puts era
      else
        puts "so wrooong"
      end
    end

  end
end
