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


What sucks about it?
--------------------

* It's written in Ruby. I tried writing it in Bash so that
anyone can use it, not just Rubyists, but no dice. It took forever to get the
`date` method to spit out the proper format, and then I couldn't figure out how to
compare the times (it uses a time buffer to account for latency). Oh, and writing Bash
is the worst. Plus, how do you test Bash? If anyone knows, feel free to tell me. My best thoughts
are you pass it function names as strings which it then invokes by placing on the line.
IDK, but this program would be way better if it were written in bash (or sh, I guess,
but are people actually committing on machines that only have sh?)
* The server is on Heroku, which has a notorious spin-up time. This will probably become
a problem (either I'll introduce time in a block so that it can be lazily retrieved, or
I'll just increase the time buffer)
* I can't decide if the class in the binary should know about exit statuses. If it does,
then I can return 1 or 0, removing untested logic. But it's dumb that the class doing all the time math is the one
that knows about exit statuses.
* It runs the server during the tests with WEBrick (because it's in the stdlib), which spams the tests. I'm sure there's a
way silence it, but didn't see anything and didn't think it was worth continuing to look.
If anyone knows, clue me in.


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
