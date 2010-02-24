class ASofterWorld < Comic
  site_name "A Softer World"
  site_url "http://www.asofterworld.com"
  feed_url "http://www.rsspect.com/rss/asw.xml"
  
  def map_routine(xml)
    items = xml.channel.items
    latest = items.each do |item|
      break item if item.title.match(/A Softer World: [0-9]+/)
    end

    if latest
      real_title = latest.description.match(/title="(.*)"/)[1]
      number = latest.title.match(/A Softer World: (.*)/)[1].strip
      self.description = "#{number}: #{real_title}"
      self.posted_on = Date.parse(latest.pubDate.to_s)
      date = self.posted_on.strftime('%Y%m%d')
      self.permalink = "http://#{site_url.host}/index.php?id=#{number}"
      self.image_url = latest.description.match(/http:\/\/www\.asofterworld\.com\/clean\/[^\/]+\.jpg/).to_s
    end
  end
end
