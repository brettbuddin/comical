module ComicFeed
  
  class QuestionableContentFetcher < ComicFeed::Fetcher
    def parse_data(xml)
      data = {}
      latest = xml.channel.items[0]
      if latest
        data[:description] = latest.title
        data[:posted_on] = Date.parse(latest.pubDate.to_s)
        data[:image_url] = latest.description.match(/http:\/\/www.questionablecontent.net\/comics\/[0-9]+\.png/).to_s
        data[:permalink] = latest.link

        return data
      end
      nil
    end
  end
  
end