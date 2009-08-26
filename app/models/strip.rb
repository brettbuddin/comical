class Strip < ActiveRecord::Base
  belongs_to :comic
  validates_presence_of :posted_on, :image_url
end
