class CtrlAltDel < Comic
  site_name "Ctrl Alt Del"
  site_url "http://cad-comic.com/cad"
  feed_url "http://www.cad-comic.com/rss/rss.xml"
  
  def map_routine(xml)
    items = xml.channel.items
    latest = items.each do |item|
      break item if item.title.match(/Ctrl\+Alt\+Del/)
    end

    if latest
      self.description = latest.title.match(/Ctrl\+Alt\+Del: (.*)/)[1]
      self.posted_on = Date.parse(latest.pubDate.to_s)
      date = self.posted_on.strftime('%Y%m%d')
      self.permalink = "#{site_url}/#{date}"

      content = ''
      open(site_url) { |s| content = s.read }
      img_url = content.match(/"http:\/\/cdn.cad-comic.com\/comics\/.+\.jpg"/)
      self.image_url = img_url[0]
    end
  end
end
