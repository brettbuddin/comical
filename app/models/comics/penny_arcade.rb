class PennyArcade < Comic
  site_name "Penny Arcade"
  site_url "http://www.penny-arcade.com"
  feed_url "http://feeds.penny-arcade.com/pa-mainsite"
  
  def map_routine(xml)
    items = xml.channel.items
    latest = items.each do |item|
      break item if item.title.match(/Comic: .*/)
    end

    if latest
      self.description = latest.title.match(/Comic: (.*)/)[1]
      self.posted_on = Date.parse(latest.pubDate.to_s)
      
      url_parts = latest.guid.to_s.match(/comic\/([0-9]+)\/([0-9]+)\/([0-9]+)\/([^\/]*)/)
      
      self.permalink = "#{site_url}/#{url_parts[0]}"

      content = ''
      open("#{site_url}/#{url_parts[0]}") { |s| content = s.read }
      img_url = content.match(/<img src="(http:\/\/art\.penny-arcade\.com\/photos\/.+\.jpg)" alt=".+"( )+\/>/)
      self.image_url = img_url[1]
    end
  end

  private

  def add_leading_zero(number)
    return number if number.to_i >= 10
    number.to_s.insert(0, '0')
  end
end
