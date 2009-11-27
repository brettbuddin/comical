module ComicFeed
  
  class CtrlaltdelFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}

      items = xml.channel.items
      latest = items.each do |item|
        break item if item.title.match(/Cad: .*/)
      end
      if latest
        data[:description] = latest.title.match(/Cad: (.*)/)[1]
        data[:posted_on] = Date.parse(latest.pubDate.to_s)

        date = data[:posted_on].strftime('%Y%m%d')
        data[:permalink] = "http://www.cad-comic.com/cad/#{date}"
        data[:image_url] = "http://www.cad-comic.com/comics/cad/#{date}.jpg"

        return data
      end
      
      nil
    end
  end
  
end
