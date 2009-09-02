module ComicsHelper
  def name_slug(comic)
    "#{comic.name.gsub(/[^a-z0-9]+/i, '-').downcase}"
  end
  
  def relative_date(posted_on)
    if Date.today == posted_on
      "<span class=\"time today\">today</span>"
    elsif Date.today - 1 == posted_on
      "<span class=\"time\">yesterday</span>"
    else
      "<span class=\"time\">#{time_ago_in_words(posted_on)} ago</span>"
    end
  end
end
