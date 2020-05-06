rbenv-package [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/bikerduweb/rbenv-package/blob/master/LICENCE)
====

Dockerfile to build rbenv ruby deb package for my own needs


## Usage

* Add all ruby versions needed in versions.txt
* Add all gems that needs to be preinstalled for each ruby versions in gems.txt

Then run
```
sh ./run.sh
```


## Build your own rbenv image


Dockerfile execute belows;

1. Pull ubuntu image
1. Install packages which are needed to build ruby
1. Clone rbenv and somes rbenv plugins
1. Install multiple versions of ruby which are defined at `versions.txt`
1. Install Bundler for each version and gems defined at `gems.txt`
1. Build package for each versions installed in ./packages


## Contribution

1. Fork ([https://github.com/bikerduweb/rbenv-package/fork](https://github.com/bikerduweb/rbenv-package/fork))
1. Create a feature branch
1. Commit your changes
1. Rebase your local changes against the master branch
1. Push it to your remote repository
1. Create new Pull Request

## Author

[bikerduweb](https://github.com/bikerduweb)
