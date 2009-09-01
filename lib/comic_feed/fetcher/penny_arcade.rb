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
        
        url_parts = latest.guid.to_s.match(/comic\/([0-9]+)\/([0-9]+)\/([0-9]+)\/([^\/]*)/)
        
        content = ''
        open("http://www.penny-arcade.com/#{url_parts[0]}") { |s| content = s.read }
        
        img_url = content.match(/<img src="(http:\/\/art\.penny-arcade\.com\/photos\/.+\.jpg)" alt="#{data[:description]}"( )+\/>/)
        data[:image_url] = img_url[1]
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