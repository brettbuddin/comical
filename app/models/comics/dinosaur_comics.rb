class DinosaurComics < Comic
  site_name "Dinosaur Comics"
  site_url "http://www.qwantz.com"
  feed_url "http://www.rsspect.com/rss/qwantz.xml"
  
  def map_routine(xml)
    latest = xml.channel.items[0]

    if latest
      self.posted_on = Date.parse(latest.pubDate.to_s)
      self.image_url = latest.description.match(/http:\/\/www\.qwantz\.com\/comics\/.*\.png/).to_s
      self.permalink = latest.link

      extra_match = latest.description.match(/class="comic" title="([^"]+)"/)
      self.extra = extra_match[1].to_s
    end
  end
end
