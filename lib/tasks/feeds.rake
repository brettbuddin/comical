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
      rescue => e
        $stderr.puts "Fetching comic (#{File.basename(f)}):"
        $stderr.puts "#{e.class}: #{e}"
        $stderr.puts "#{e.backtrace.join("\n")}"
        $stderr.puts
      end
    end
  end

end

