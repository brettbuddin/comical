module ComicsHelper
  def name_slug(comic)
    "#{comic.name.gsub(/[^a-z0-9]+/i, '-').downcase}"
  end
  
  def relative_date(posted_on)
    if Date.today == posted_on
      "<time class=\"today\">today</time>"
    elsif Date.today - 1 == posted_on
      "<time>yesterday</time>"
    else
      "<time>#{time_ago_in_words(posted_on)} ago</time>"
    end
  end
end
