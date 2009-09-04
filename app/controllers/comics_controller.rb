class ComicsController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        @format = 'list'
        @comics = Comic.find(:all, :order => 'name ASC')
        @updated = @comics.select { |comic| Date.today == comic.strips.find(:last).posted_on if comic.strips.find(:last) }
      end
      format.newspaper do
        @format = 'newspaper'
        @comics = Comic.find(:all, :include => [:strips], :order => 'strips.posted_on DESC')
        render :template => 'comics/newspaper'
      end
    end
  end
  
  def show
    @comic = Comic.find_by_url_name(params[:id])
    if @comic
      @strip = @comic.strips.find(:last)
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
