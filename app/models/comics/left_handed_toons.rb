class LeftHandedToons < Comic
  site_name "Left-Handed Toons"
  site_url "http://www.lefthandedtoons.com"
  feed_url "http://www.lefthandedtoons.com/rss"
  
  def map_routine(xml)
    items = xml.channel.items
    latest = items.each do |item|
      break item if item.description.match(/http:\/\/www\.lefthandedtoons\.com\/toon\/[^\/]+\.gif/)
    end

    if latest
      self.description = latest.title
      self.posted_on = Date.parse(latest.pubDate.to_s)
      image = latest.description.match(/http:\/\/www\.lefthandedtoons\.com\/toon\/([^\/]+\.gif)/)[1]
      self.image_url = "#{site_url}/toons/#{image}"
      self.permalink = latest.description.match(/http:\/\/www\.lefthandedtoons\.com\/[0-9]+/)[0]
    end
  end
end
