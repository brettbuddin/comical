namespace :feeds do

  task :update => :environment do
    Dir.glob(File.join(File.dirname(__FILE__), '../../app/models/comics/*.rb')).each do |f|
      begin
        comic = File.basename(f).to(-4).underscore.camelize.constantize.new
        xml = comic.fetch

        if xml
          comic.map(xml)
          if latest = comic.class.find(:last)
            if comic.image_url != latest.image_url
              comic.save
            end
          else
            comic.save
          end
        end #xml
      rescue
        puts "Error: #{$!}"
      end
    end
  end

end

