class ComicsController < ApplicationController
  def index
    @comics = Comic.select('type,max(posted_on) as posted_on').group(:type).all
  end

  def show
    slug = params[:id].underscore
    comics = comic_list

    if comics.include?(slug)
      @comic = comic_class(slug).order('posted_on ASC').last

      raise ActiveRecord::RecordNotFound unless @comic
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def all
    @comics = Comic.select('distinct(type), *').group(:type).all
  end

  private

  def comic_class(slug)
    comics = comic_list
    
    comics[comics.index(slug)].camelize.constantize
  end

  def comic_list
    @comic_list ||= Dir.glob(File.join(File.dirname(__FILE__), '../../app/models/comics/*.rb')).collect do |f|
      File.basename(f).to(-4)
    end
  end
end
