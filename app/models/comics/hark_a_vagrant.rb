class HarkAVagrant < Comic
  site_name "Hark, A Vagrant"
  site_url "http://www.harkavagrant.com"
  feed_url "http://www.rsspect.com/rss/vagrant.xml"
  
  def map_routine(xml)
    latest = xml.channel.items[0]

    if latest
      self.description = latest.title.match(/Hark, a Vagrant: (.*)/)[1].to_s
      self.posted_on = Date.parse(latest.pubDate.to_s)
      self.image_url = latest.description.match(/http:\/\/www\.harkavagrant\.com\/[^\/]+\/[^\/]+.(png|jpg)/).to_s
      self.permalink = latest.link
    end
  end
end

