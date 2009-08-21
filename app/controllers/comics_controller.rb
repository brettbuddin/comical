class ComicsController < ApplicationController
  def index
    @comics = Comic.find :all
  end
end
