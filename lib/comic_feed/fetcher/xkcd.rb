module ComicFeed
  
  class XkcdFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      latest = xml.channel.items[0]
      if latest
        data[:description] = latest.title
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        data[:image_url] = latest.description.match(/http:\/\/imgs\.xkcd\.com\/comics\/[^\/]+\.png/).to_s
        data[:permalink] = latest.link.to_s
        
        extra_match = latest.description.match(/title="([^"]+)"/)
        data[:extra] = extra_match[1].to_s

        return data
      end
      nil
    end
  end
  
end
