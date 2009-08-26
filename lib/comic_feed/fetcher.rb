require 'rss/2.0'
require 'open-uri'
require 'net/http'
require 'digest/sha1'
require 'uri'

module ComicFeed

  class Fetcher  
    def fetch(url)
      content = ''
      open(url) { |s| content = s.read }
      xml = RSS::Parser.parse(content, false)
      parse_data(xml)
    end
    
    def image_digest(image_url)      
      url = URI.parse(image_url.to_s)
      req = Net::HTTP::Get.new(url.path)
      res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
      Digest::SHA1.hexdigest(res.body)
    end
  end

end
