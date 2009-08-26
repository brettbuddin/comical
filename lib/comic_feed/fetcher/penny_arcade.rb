module ComicFeed
  
  class PennyArcadeFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      
      items = xml.channel.items
      latest = items.each do |item|
        break item if item.title.match(/Comic: .*/)
      end
      if latest
        data[:description] = latest.title.match(/Comic: (.*)/)[1]
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        
        url_parts = latest.guid.to_s.match(/http:\/\/www\.penny-arcade\.com\/comic\/([0-9]+)\/([0-9]+)\/([0-9]+)\/([^\/]*)/)
        data[:image_url] = "http://penny-arcade.com/images/#{url_parts[1]}/#{url_parts[1]}#{add_leading_zero(url_parts[2])}#{add_leading_zero(url_parts[3])}.jpg"
        return data
      end
      
      nil
    end
    
    def add_leading_zero(number)
      return number if number.to_i >= 10
      number.to_s.insert(0, '0')
    end
  end
  
end