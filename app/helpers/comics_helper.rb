module ComicsHelper
  def name_slug(comic)
    "#{comic.name.gsub(/[^a-z0-9]+/i, '-').downcase}"
  end
end
