module ComicFeed
  
  class WondermarkFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      
      items = xml.channel.items
      latest = items.each do |item|
        break item if item.title.match(/#[0-9]+; .*/)
      end
      if latest
        title_parts = latest.title.match(/#([0-9]+); (.*)/)
        data[:description] = title_parts[2]
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        data[:image_url] = latest.description.match(/http:\/\/wondermark.com\/c\/.*\.gif/).to_s
        data[:permalink] = "http://wondermark.com/#{title_parts[1]}/"
        
        return data
      end
      
      nil
    end
  end
  
end
