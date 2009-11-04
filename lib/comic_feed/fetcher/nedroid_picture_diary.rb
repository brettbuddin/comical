module ComicFeed
  
  class NedroidPictureDiaryFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      latest = xml.channel.items[0]

      items = xml.channel.items
      latest = items.each { |item| break item if item.description.match(/http:\/\/nedroid\.com\/comic\/comics-rss\/[^\/]+\.(gif|png)/) }

      if latest
        data[:description] = latest.title
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        data[:image_url] = latest.description.match(/http:\/\/nedroid\.com\/comic\/comics-rss\/[^\/]+\.(gif|png)/).to_s
        data[:permalink] = latest.link

        return data
      end
      nil
    end
  end
  
end
