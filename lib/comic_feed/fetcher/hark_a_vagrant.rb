module ComicFeed
  
  class HarkAVagrantFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      latest = xml.channel.items[0]
      if latest
        data[:description] = latest.title.match(/Hark, a Vagrant: (.*)/)[1].to_s
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        data[:image_url] = latest.description.match(/http:\/\/www.harkavagrant.com\/[^\/]+\/[^\/]+.png/).to_s
        data[:permalink] = latest.link

        return data
      end
      nil
    end
  end
  
end
