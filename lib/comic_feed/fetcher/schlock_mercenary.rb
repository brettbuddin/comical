module ComicFeed
  
  class SchlockMercenaryFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      latest = xml.channel.items[0]
      if latest
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        data[:image_url] = latest.description.match(/http:\/\/schlockmercenary\.com\/comics\/schlock[0-9]+.jpg/).to_s
        data[:permalink] = latest.link
        return data
      end
      nil
    end
  end
  
end
