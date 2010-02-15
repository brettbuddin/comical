class Xkcd < Comic
  site_name "xkcd"
  site_url "http://www.xkcd.com"
  feed_url "http://www.xkcd.com/rss.xml"
  
  def map_routine(xml)
    latest = xml.channel.items[0]

    if latest
      self.description = latest.title
      self.posted_on = Date.parse(latest.pubDate.to_s)
      self.image_url = latest.description.match(/http:\/\/imgs\.xkcd\.com\/comics\/[^\/]+\.png/).to_s
      self.permalink = latest.link
      
      extra_match = latest.description.match(/title="([^"]+)"/)
      self.extra = extra_match[1].to_s
    end
  end
end
