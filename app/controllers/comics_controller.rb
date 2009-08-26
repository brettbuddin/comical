class ComicsController < ApplicationController
  def index
    @comics = Comic.find(:all)
    @updated = @comics.select { |comic| Date.today == comic.strips.find(:last).posted_on }
  end
  
  def show
    @comic = Comic.find(params[:id])
  end
end
