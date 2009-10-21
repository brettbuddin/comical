module ComicFeed
  
  class CtrlaltdelFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}

      items = xml.channel.items
      latest = items.each do |item|
        break item if item.title.match(/Comic: .*/)
      end
      if latest
        data[:description] = latest.title.match(/Comic: (.*)/)[1]
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        data[:permalink] = latest.link
        
        url_parts = latest.link.match(/([0-9]+)-([0-9]+)-([0-9]+)/)
        data[:image_url] = "http://www.ctrlaltdel-online.com/comics/#{url_parts[1]}#{url_parts[2]}#{url_parts[3]}.jpg"

        return data
      end
      
      nil
    end
  end
  
end
