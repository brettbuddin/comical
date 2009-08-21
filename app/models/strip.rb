class Strip < ActiveRecord::Base
  belongs_to :comic
  validates_presence_of :name, :posted_on, :image_digest, :image_url
end
