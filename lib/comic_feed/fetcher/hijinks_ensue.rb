module ComicFeed
  
  class HijinksEnsueFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      
      items = xml.channel.items
      latest = items.each do |item|
        break item if item.description.match(/http:\/\/hijinksensue\.com\/comics\/[0-9]+\-[0-9]+\-[0-9]+[^\/]+\.jpg/)
      end
      if latest
        data[:description] = latest.title
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        
        data[:image_url] = latest.description.match(/http:\/\/hijinksensue\.com\/comics\/[0-9]+\-[0-9]+\-[0-9]+[^\/]+\.jpg/)[0] 
        data[:permalink] = latest.link

        return data
      end
      
      nil
    end
  end
  
end
