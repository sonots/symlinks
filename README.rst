Symlinks
==============

This script makes symbolic links from files in a directory to files in a directory only if they are identical.
This script would be useful to reduce storage size for daily generated documents.

Requirements
------------

- ruby

How to install
--------------

::

  gem install bundler
  bundle install

How to use
----------

  ruby symlinks.rb TARGET_DIR SYMLINK_DIR

