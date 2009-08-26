module ComicFeed
  
  class WondermarkFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      
      items = xml.channel.items
      latest = items.each do |item|
        break item if item.title.match(/#[0-9]+; .*/)
      end
      if latest
        data[:description] = latest.title.match(/#[0-9]+; (.*)/)[1]
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        data[:image_url] = latest.description.match(/http:\/\/wondermark.com\/c\/.*\.gif/).to_s
        
        return data
      end
      
      nil
    end
  end
  
end