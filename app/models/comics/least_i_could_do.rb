class LeastICouldDo < Comic
  site_name "Least I Could Do"
  site_url "http://leasticoulddo.com"
  feed_url "http://feeds.feedburner.com/LICD?format=xml"
  
  def map_routine(xml)
    items = xml.channel.items
    latest = items.each do |item|
      break item if item.title.match(/Comic: [0-9]+/)
    end

    if latest
      self.description = latest.title.match(/Comic: (.*)/)[1]
      self.posted_on = Date.parse(latest.pubDate.to_s)
      self.permalink = latest.link
      self.image_url = "#{site_url}/comics/#{self.description.gsub(/-/, '')}.gif"
    end
  end
end
