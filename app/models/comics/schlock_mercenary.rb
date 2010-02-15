class SchlockMercenary < Comic
  site_name "Schlock Mercenary"
  site_url "http://schlockmercenary.com"
  feed_url "http://feeds.feedburner.com/SchlockRSS?format=xml"
  
  def map_routine(xml)
    latest = xml.channel.items[0]

    if latest
      self.posted_on = Date.parse(latest.pubDate.to_s)
      self.image_url = latest.description.match(/http:\/\/schlockmercenary\.com\/comics\/schlock[0-9]+.jpg/).to_s
      self.permalink = latest.link
    end
  end
end
