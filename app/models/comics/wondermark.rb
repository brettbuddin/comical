class Wondermark < Comic
  site_name "Wondermark"
  site_url "http://wondermark.com"
  feed_url "http://feeds.feedburner.com/wondermark"
  
  def map_routine(xml)
    items = xml.channel.items
    latest = items.each do |item|
      break item if item.title.match(/#[0-9]+; .*/)
    end

    if latest
      title_parts = latest.title.match(/#([0-9]+); (.*)/)
      self.description = title_parts[2]
      self.posted_on = Date.parse(latest.pubDate.to_s)
      self.image_url = latest.description.match(/http:\/\/wondermark.com\/c\/.*\.gif/).to_s
      self.permalink = "http://wondermark.com/#{title_parts[1]}/"
    end
  end
end
