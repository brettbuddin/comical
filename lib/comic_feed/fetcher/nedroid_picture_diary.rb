module ComicFeed
  
  class NedroidPictureDiaryFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      latest = xml.channel.items[0]
      if latest
        data[:description] = latest.title
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        data[:image_url] = latest.description.match(/http:\/\/nedroid\.com\/comics-rss\/[^\/]+\.gif/).to_s

        return data
      end
      nil
    end
  end
  
end