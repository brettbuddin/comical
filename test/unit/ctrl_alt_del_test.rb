require 'test_helper'

class CtrlAltDelTest < ActiveSupport::TestCase
  context "A CtrlAltDel instance" do
    should_describe_site 
    should_describe_feed 
    should_map
    should_fetch_image
  end
end
