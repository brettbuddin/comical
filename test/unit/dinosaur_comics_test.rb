require 'test_helper'

class DinosaurComicsTest < ActiveSupport::TestCase
  context "A DinosaurComics instance" do
    should_describe_site 
    should_describe_feed 
    should_map
  end
end
