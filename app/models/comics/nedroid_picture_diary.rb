class NedroidPictureDiary < Comic
  site_name "Nedroid Picture Diary"
  site_url "http://nedroid.com"
  feed_url "http://nedroid.com/feed"
  
  def map_routine(xml)
    latest = xml.channel.items[0]
    items = xml.channel.items
    latest = items.each { |item| break item if item.description.match(/http:\/\/nedroid\.com\/comic\/comics-rss\/[^\/]+\.(gif|png)/) }

    if latest
      self.description = latest.title
      self.posted_on = Date.parse(latest.pubDate.to_s)
      self.image_url = latest.description.match(/http:\/\/nedroid\.com\/comic\/comics-rss\/[^\/]+\.(gif|png)/).to_s
      self.permalink = latest.link
    end
  end
end


