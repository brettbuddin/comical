require 'test_helper'

class LolBotsTest < ActiveSupport::TestCase
  context "A LolBots instance" do
    should_describe_site 
    should_describe_feed 
    should_map
  end
end
