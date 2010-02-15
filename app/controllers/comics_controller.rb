class ComicsController < ApplicationController
  def index
    @comics = Comic.find(:all, :order => 'created_at DESC', :group => :type) 
    @updated = @comics.select { |comic| Date.today == comic.posted_on }
  end

  def show
    slug = params[:id].underscore
    comics = Dir.glob(File.join(File.dirname(__FILE__), '../../app/models/comics/*.rb')).collect do |f|
      File.basename(f).to(-4)
    end

    if comics.include?(slug)
      @comic = comics[comics.index(slug)].camelize.constantize.find(:last)
      raise ActiveRecord::RecordNotFound unless @comic
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
