[![Build Status](https://secure.travis-ci.org/intuit/redis-cookbook.png)](http://travis-ci.org/intuit/redis-cookbook)

# redis cookbook

This cookbook installs the redis server found here http://redis.io/

# Requirements
NA

# Usage

Redis is an open source, BSD licensed, advanced key-value store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets and sorted sets.

# Attributes
The following attributes are configurable currently:
version, package_name, user, group, path, pidfile, conf, port

# Recipes
The default recipe installs the redis server and associated binaries.  It also configures the system to run as the redis users.

# Author

Author:: Intuit, Inc. (<bradly_feeley@intuit.com>)
