require 'test_helper'

class HarkAVagrantTest < ActiveSupport::TestCase
  context "A HarkAVagrant instance" do
    should_describe_site 
    should_describe_feed 
    should_map
    should_fetch_image
  end
end
