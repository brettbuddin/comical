namespace :feeds do
  
  task :update => :environment do
    comics = Comic.find :all
        
    comics.each do |comic|
      begin
        fetcher = "ComicFeed::#{comic.name.downcase.gsub(/[ -]/, '_').camelize}Fetcher".constantize.new
        
        Strip.transaction do
          strip = Strip.new(fetcher.fetch(comic.feed_url))
          if latest = comic.strips.find(:last)
            if strip.image_url != latest.image_url
              comic.strips << strip
            end
          else
            comic.strips << strip
          end
        end
      rescue
        puts "Problem: #{$!}"
      end
    end
  end
  
end