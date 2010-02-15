class QuestionableContent < Comic
  site_name "Questionable Content"
  site_url "http://www.questionablecontent.net"
  feed_url "http://www.questionablecontent.net/QCRSS.xml"
  
  def map_routine(xml)
    latest = xml.channel.items[0]

    if latest
      self.description = latest.title
      self.posted_on = Date.parse(latest.pubDate.to_s)
      self.image_url = latest.description.match(/http:\/\/www.questionablecontent.net\/comics\/[0-9]+\.png/).to_s
      self.permalink = latest.link        
    end
  end
end
