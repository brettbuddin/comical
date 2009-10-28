module ComicFeed
  
  class CyanideAndHappinessFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      
      items = xml.channel.items
      latest = items.each do |item|
        break item if item.title.match(/[0-9]+\.[0-9]+\.[0-9]+/)
      end
      if latest
        data[:description] = latest.title
        data[:posted_on] = Date.parse(latest.pubDate.to_s) + 1.day
        data[:permalink] = latest.link
        
        content = ''
        open(data[:permalink]) { |s| content = s.read }

        img_url = content.match(/http:\/\/www\.explosm\.net\/db\/files\/Comics\/[^\/]+\/[^\/]+\.png/)
        data[:image_url] = img_url[0]

        return data
      end
      
      nil
    end
  end
  
end
