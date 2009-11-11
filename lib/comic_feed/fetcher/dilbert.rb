module ComicFeed
  
  class DilbertFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      latest = xml.channel.items[0]
      if latest
        data[:description] = latest.title.match(/Comic for (.*)/)[1]
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        data[:permalink] = latest.link
        data[:image_url]  = latest.description.match(/http:\/\/dilbert\.com\/dyn\/str_strip\/.*\.gif/)[0]
        return data
      end
      
      nil
    end
  end
  
end
