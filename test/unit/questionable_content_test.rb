require 'test_helper'

class QuestionableContentTest < ActiveSupport::TestCase
  context "A QuestionableContent instance" do
    should_describe_site 
    should_describe_feed 
    should_map
  end
end
