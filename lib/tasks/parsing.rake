namespace :parsing do
  task :parse_metadata => :environment do
    require 'oai'
    require 'rexml/document'

    Dir.foreach('/Users/Adam/sng-histogram/europeana-nahlady') do |image|
      #next if image == '.' or image== '..'
        #id=image.split('--')[1]
        client = OAI::Client.new "http://www.webumenia.sk/oai-pmh/%3fverb=ListSets%26set=Europeana%20SNG"
        client.list_records.full.each do |record|
          puts record.metadata
          Record.new(xml_body: record.metadata.to_s.tr(';','')).save
        end
    end

    # Get all pages together (may take a *very* long time to complete)
    client.list_records.full.each do |record|
      Record.new(xml_body: record.metadata.to_s.tr(';','')).save
      puts
    end
  end

  task :add_filenames=> :environment do
    Dir.foreach("#{Rails.root}/europeana-nahlady") do |image|
      next if image == '.' or image== '..'
      id=image.split('--')[1]

      r=Record.where(identifier: id).first
      if r
        r.file_name=image
        r.save
      end
    end
  end
end