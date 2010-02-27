class PicturesForSadChildren < Comic
  site_name "Pictures for Sad Children"
  site_url "http://www.picturesforsadchildren.com"
  feed_url "http://www.rsspect.com/rss/pfsc.xml"
  
  def map_routine(xml)
    latest = xml.channel.items[0]

    if latest
      self.description = latest.title
      self.posted_on = Date.parse(latest.pubDate.to_s)
      self.image_url = latest.description.match(/http:\/\/www\.picturesforsadchildren\.com\/comics\/[0-9]+\.png/).to_s
      self.permalink = latest.link
    end
  end
end

