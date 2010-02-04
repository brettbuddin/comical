namespace :feeds do
  
  task :update => :environment do
    comics = Comic.find :all
        
    comics.each do |comic|
        begin
          fetcher = "ComicFeed::#{comic.name.downcase.gsub(/[+,'\"]/, '').gsub(/[ -]/, '_').camelize}Fetcher".constantize.new
          
          strip = Strip.new(fetcher.fetch(comic.feed_url))
          if latest = comic.strips.find(:last)
            if strip.image_url != latest.image_url
              comic.strips << strip
            end
          else
            comic.strips << strip
          end
        rescue; end
    end
  end
  
end
