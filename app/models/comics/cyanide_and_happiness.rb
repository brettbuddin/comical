class CyanideAndHappiness < Comic
  site_name "Cyanide and Happiness"
  site_url "http://www.explosm.net/comics"
  feed_url "http://feeds.feedburner.com/Explosm"
  
  def map_routine(xml)
    items = xml.channel.items
    latest = items.each do |item|
      break item if item.title.match(/[0-9]+\.[0-9]+\.[0-9]+/)
    end

    if latest
      self.description = latest.title
      self.posted_on = Date.parse(latest.pubDate.to_s) + 1.day
      self.permalink = latest.link

      content = ''
      open(self.permalink) { |s| content = s.read }
      img_url = content.match(/http:\/\/www\.explosm\.net\/db\/files\/Comics\/[^\/]+\/[^\/]+\.png/)
      self.image_url = img_url[0]
    end
  end
end
