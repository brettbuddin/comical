Comic Strip Fix
==============
Comic Strip Fix is a Rails application that periodically polls a selected set of web comics for updates so you don't have to. The application's purpose is not to keep an archive of past comic strips, but to allow the user to see only the latest strips. This fullfills the needs of most users, since they usually have to travel around, via their browser bookmarks, to see the daily comic strips. Another goal of the project is to provide users with a consistent UI for viewing strips.

Rake Task
======

The key to the basic functionality of the application, and how it gets all of it's information is in the rake task (located at **/lib/tasks/feeds.rake**). This task runs through all known comics, and using the appropriate model/adapter (located at **/app/models/comics/**), it fetches each feed to determine if a new strip has been posted. If a new strip has been posted, the strip's information is saved.

Cron Job
======

Our feed update rake task is run with the following crontab entry:

`*/30 0,07-23 * * * cd /home/brett/web/comical.intraspirit.net/public/current/ && /opt/ruby-enterprise-1.8.7/bin/rake feeds:update RAILS_ENV=production > /home/brett/web/comical.intraspirit.net/log/feeds_update.log`

This directive instructs the machine to execute the rake task every half-hour, between the hours 7am-11pm and at 12am (the current environment's timezone is set to EST) every day.

Adding a Comic
======

1. Write a unit test
------
The first thing you should do is create a unit test, because this will give you a basic foundation to make sure that your implementation actually works. At the very least, your unit test should look something like this: [test/unit/xkcd_test.rb](http://github.com/brettbuddin/comical/blob/master/test/unit/xkcd_test.rb)

2. Implement your model
------
Next, you'll write new sub-class of the `Comic` model to make the application aware of your comic. Comical looks for the separate comic implementations in the `app/models/comics` directory. There are three *required* class methods that you will use to describe the site details and feed location to the application; those are:

> `site_name` Sets the name of the comic to be used throughout the site.
>
> `site_url` Sets the website URL of the comic. This will be used to create a permalink to the image.
>
> `feed_url` Sets the RSS feed URL to fetch from for the comic.

Additionally, you'll define your very own `map_routine(xml)` that will map XML data to the following model fields:

> `description:string` Most often the title, but in the event of it's absence can be filled with a textual date.
>
> `posted_on:date` The published on date from the RSS feed.
>
> `image_url:string`  URL of the comic strip image.
>
> `permalink:string` Permalink to the page on the author's website that shows the comic strip.
>
> `extra:string` (Optional) Extra textual information that comes along with the comic strip. Examples: description, alt text, title text (xkcd anyone?)

Example model implementation: [app/model/comics/xkcd.rb](http://github.com/brettbuddin/comical/blob/master/app/models/comics/xkcd.rb)

3. Feeds:Update and Enjoy
------
The next time you run `rake feeds:update`, the application will use your new model to fetch the comic.

4. Pull Request
------
Submit a [pull request](http://github.com/brettbuddin/comical/pull_request/) so that we can get your comic added to http://comicstripfix.com!

License
======
Released under GNU General Public License (GPL) version 3. Basically, this means that if you distribute changes, you must make them available under the same open-source license. http://www.gnu.org/copyleft/gpl.html
