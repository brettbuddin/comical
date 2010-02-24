class ComicsController < ApplicationController
  def index
    @comics = []
    comics = Comic.find(:all).to_set.classify { |comic| comic.class.name }
    comics.each do |comic, list|
      @comics << list.to_a[0]  
    end
  end

  def show
    slug = params[:id].underscore
    comics = Dir.glob(File.join(File.dirname(__FILE__), '../../app/models/comics/*.rb')).collect do |f|
      File.basename(f).to(-4)
    end

    if comics.include?(slug)
      @comic = comics[comics.index(slug)].camelize.constantize.find(:last, :order => 'posted_on ASC')
      raise ActiveRecord::RecordNotFound unless @comic
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
