class ComicsController < ApplicationController
  def index
    @comics = Comic.find(:all, :select => 'type,max(posted_on) as posted_on', :group => :type)
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

  def comics
    Dir.glob(File.join(File.dirname(__FILE__), '../../app/models/comics/*.rb')).collect do |f|
      File.basename(f).to(-4)
    end
  end
end
