class CtrlAltDel < Comic
  site_name "Ctrl Alt Del"
  site_url "http://www.cad-comic.com/cad"
  feed_url "http://feeds.feedburner.com/cad-comic"
  
  def map_routine(xml)
    items = xml.channel.items
    latest = items.each do |item|
      break item if item.title.match(/Cad: .*/)
    end

    if latest
      self.description = latest.title.match(/Cad: (.*)/)[1]
      self.posted_on = Date.parse(latest.pubDate.to_s)
      date = self.posted_on.strftime('%Y%m%d')
      self.permalink = "http://#{site_url.host}/cad/#{date}"
      self.image_url = "http://#{site_url.host}/comics/cad/#{date}.jpg"
    end
  end
end
