module ComicFeed
  
  class LolbotsFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}

      items = xml.channel.items
      latest = items.each { |item| break item if item.title.match(/LOLBOTS [0-9]+\/[0-9]+\/[0-9]+.*/) }

      if latest
        data[:description] = latest.title.match(/LOLBOTS [0-9]+\/[0-9]+\/[0-9]+( :: )?(.*)/)[2]
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        data[:permalink] = latest.link
        
        date = latest.link.match(/[0-9]+/)[0]
        data[:image_url] = "http://www.lolbots.com/strips/#{date}.png"

        return data
      end
      
      nil
    end
  end
  
end
