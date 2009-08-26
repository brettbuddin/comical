class ComicsController < ApplicationController
  def index
    @comics = Comic.find(:all, :order => 'name ASC')
    @updated = @comics.select { |comic| Date.today == comic.strips.find(:last).posted_on if comic.strips.find(:last) }
  end
  
  def show
    @comic = Comic.find_by_url_name(params[:id])
  end
end
