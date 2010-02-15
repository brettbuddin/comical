class HijinksEnsue < Comic
  site_name "Hijinks Ensue"
  site_url "http://hijinksensue.com"
  feed_url "http://hijinksensue.com/feed"
  
  def map_routine(xml)
    items = xml.channel.items
    latest = items.each do |item|
      break item if item.description.match(/http:\/\/hijinksensue\.com\/comics\/[0-9]+\-[0-9]+\-[0-9]+[^\/]+\.jpg/)
    end

    if latest
      self.description = latest.title
      self.posted_on = Date.parse(latest.pubDate.to_s)
      
      self.image_url = latest.description.match(/http:\/\/hijinksensue\.com\/comics\/[0-9]+\-[0-9]+\-[0-9]+[^\/]+\.jpg/)[0] 
      self.permalink = latest.link
    end
  end
end
