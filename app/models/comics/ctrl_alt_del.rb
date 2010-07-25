class CtrlAltDel < Comic
  site_name "Ctrl Alt Del"
  site_url "http://cad-comic.com/cad"
  feed_url "http://feeds.feedburner.com/cad-comic"
  
  def map_routine(xml)
    items = xml.channel.items
    latest = items.each do |item|
      break item if item.title.match(/Ctrl\+Alt\+Del/)
    end

    if latest
      self.description = latest.title.match(/Ctrl\+Alt\+Del: (.*)/)[1]
      self.posted_on = Date.parse(latest.pubDate.to_s)
      date = self.posted_on.strftime('%Y%m%d')
      self.permalink = "http://#{site_url.host}/cad/#{date}"

      content = ''
      open(site_url) { |s| content = s.read }
      img_url = content.match(/"(\/comics\/.+\.jpg)"/)
      self.image_url = "http://static.#{site_url.host}#{img_url[1]}"
    end
  end
end
