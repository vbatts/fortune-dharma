fortune-dharma
==============

Bringing dharma teachings, to your fortune cookies :)



Dependencies
------------

the `fortune` command, usually included in bsd-games

Install
-------

	$> make
	$> make install DESTDIR=/path/of/your/choice

This lands the fortune files in "/usr/share/games/fortunes".
If you need these fortune files elsewhere pass the following:

	$> make install fortunedir=/path/of/your/choice

To enable it on a typical login prompt, just make 
the profile file executable.

	#> chmod +x /etc/profile.d/dharma-login-fortune.*sh


Extras
------

In the bin/ directory, there is a simple fortune command written in ruby.
The benefit it has, is it reads from raw fortune files (pre strfile), and for kicks
it has graphics mode, for displaying in X11
Usage: ./bin/fortune.rb [-g] ./fortunes/

License
-------

Cited sources are subject to their licensing.
Any further license is described in LICENSE


Sources and more information
----------------------------

* Training the Mind - http://www.dalailama.com/teachings/training-the-mind
* http://www.accesstoinsight.org/
** Dhammapda - http://www.accesstoinsight.org/tipitaka/kn/dhp/index.html
* Dhammapda - http://www.gutenberg.org/ebooks/2017


Copyright
---------

2010,2011 Vincent Batts, Vienna, VA, USA

