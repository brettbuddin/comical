require 'test_helper'

class HijinksEnsueTest < ActiveSupport::TestCase
  context "A HijinksEnsue instance" do
    should_describe_site 
    should_describe_feed 
    should_map
  end
end
