# Synchronicity

An ongoing experiment in displaying acausal parallelism. Built with [Dashing](http://shopify.github.com/dashing).

## Development

### Basics

This assumes development on Mac OS X. Things you should have installed are listed below with the easiest way to get them if you do not:

- Homebrew

`$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

- Git

`$ brew install git`

Some sort of Ruby version manager is nice to have, but not necessary. I prefer RVM:

`$ curl -sSL https://get.rvm.io | bash -s stable`

If Terminal responds to `brew` and `git` (and `rvm`) continue on.

### Setup

Clone the app and `bundle`:

```
$ git clone git@github.com:O-I/synchronicity.git
$ cd synchronicity
$ bundle install
```

Note that the app is configured to use Ruby 2.2.3 in production, but if you'd like to give it a try with your local version of Ruby, comment out the `ruby '2.2.3'` line in the `Gemfile` before running `bundle install`.

You'll need [Twitter](https://dev.twitter.com) and [Instagram](https://instagram.com/developer/) keys for their respective widgets to work. Then create a `.env` file in the root that mimics the structure of `.env_example` using your development keys. You should also set the app's `AUTH_TOKEN`. You can generate one with Ruby using `SecureRandom.uuid`.

To start the server:

```
$ dashing start
```

Or, to run it using Puma:

```
$ gem install foreman
$ foreman start
```

Run `dashing` from the command line to find out what command line tools are available to you.