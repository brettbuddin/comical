class Dilbert < Comic
  site_name "Dilbert"
  site_url "http://www.dilbert.com"
  feed_url "http://feeds.dilbert.com/DilbertDailyStrip"
  
  def map_routine(xml)
    latest = xml.channel.items[0]

    if latest
      self.description = latest.title.match(/Comic for (.*)/)[1]
      self.posted_on = Date.parse(latest.pubDate.to_s)
      self.permalink = latest.link
      self.image_url  = latest.description.match(/http:\/\/dilbert\.com\/dyn\/str_strip\/.*\.gif/)[0]
    end
  end
end
