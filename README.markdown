Comical
==============
Comical is a Rails application that periodically polls a selected set of web comics for updates so you don't have to. The application's purpose is not to keep an archive of past comic strips, but to allow the user to see only the latest strips. This fullfills the needs of most users, since they usually have to travel around, via their browser bookmarks, to see the daily comic strips. Another goal of the project is to provide users with a consistent UI for viewing strips.

Rake Task
======

The key to the basic functionality of the application, and how it gets all of it's information is in the rake task (located at **/lib/tasks/feeds.rake**). This task runs through all known comics and using the appropriate fetching adapter (located at **/lib/comic_feed/fetcher/**), fetches each feed to determine if a new strip has been posted. If a new strip has been posted, the strip's information is saved.

Cron Job
======

Our feed update rake task is run with the following crontab entry:

``*/30 0,07-23 * * * cd /home/brett/web/comical.intraspirit.net/public/current/ && /opt/ruby-enterprise-1.8.6-20090421/bin/rake feeds:update RAILS_ENV=production > /home/brett/web/comical.intraspirit.net/log/feeds_update.log``

This directive instructs the machine to execute the rake task every half-hour, between the hours 7am-12pm (the current environment's timezone is set to EST) every day.
