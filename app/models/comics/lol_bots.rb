class LolBots < Comic
  site_name "LOL Bots"
  site_url "http://www.lolbots.com"
  feed_url "http://www.lolbots.com/lol.xml"
  
  def map_routine(xml)
    items = xml.channel.items
    latest = items.each { |item| break item if item.title.match(/LOLBOTS [0-9]+\/[0-9]+\/[0-9]+.*/) }

    if latest
      self.description = latest.title.match(/LOLBOTS [0-9]+\/[0-9]+\/[0-9]+( :: )?(.*)/)[2]
      self.posted_on = Date.parse(latest.pubDate.to_s)
      self.permalink = latest.link
      
      date = latest.link.match(/[0-9]+/)[0]
      self.image_url = "#{site_url}/strips/#{date}.png"
    end
  end
end
