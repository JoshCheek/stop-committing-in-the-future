What?
-----

A git hook to fail commits when your local time is wrong.


Why?
----

Because I committed 4 months into the future on a project after
changing my local time while doing some exploratory testing.


How do I install it?
--------------------

Still working on that (Probably just copy it into your .git/hooks dir and make it executable)

Oh, and you'll need to make sure you `$ gem install rest-client` \*sigh\*


Where is the server?
--------------------

[what-time-is-it.heroku.com](http://what-time-is-it.heroku.com/)

So I totally looked at like ten sites to try to get this data. Thought I had it for a bit
with [this](http://tycho.usno.navy.mil/cgi-bin/timer.pl) one, but it has no year. In the end,
making my own was simple and fun. For some definitions of those words.


What's the license?
-------------------

               DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                       Version 2, December 2012

    Copyright (C) 2012 Josh Cheek josh.cheek@gmail.com

    Everyone is permitted to copy and distribute verbatim or modified
    copies of this license document, and changing it is allowed as long
    as the name is changed.

               DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
      TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

     0. You just DO WHAT THE FUCK YOU WANT TO.
