![Gistance](https://raw.github.com/sush/gistance/master/gistance.png)

Simple Ruby wrapper for the [Google Distance Matrix API](https://developers.google.com/places/documentation).

**Current version**: [![Gem Version](https://badge.fury.io/rb/gistance.png)](http://badge.fury.io/rb/gistance)

**Build status**: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![Build Status](https://secure.travis-ci.org/sush/gistance.png?branch=master)](http://travis-ci.org/sush/gistance)

**Code metrics**:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![Code Climate](https://codeclimate.com/github/sush/gistance.png)](https://codeclimate.com/github/sush/gistance)
[![Coverage Status](https://coveralls.io/repos/sush/gistance/badge.png?branch=master)](https://coveralls.io/r/sush/gistance?branch=master)

**Ruby support**:

- 1.9.2
- 1.9.3
- 2.0.0
- 2.1.1

## Installation

Install via Rubygems

    gem install gistance

or add to your Gemfile

    gem 'gistance'

### Configuration

API methods are available as module methods

```ruby
Gistance.configure do |c|
  c.api_key = 'YOUR_API_KEY'
  c.unit = 'imperial' # default to metric
  c.language = 'fr' # default to en
  c.sensor = true # default to false
end
```

or as client instance methods

```ruby
Gistance::Client.new(
  api_key: 'YOUR_API_KEY',
  unit: 'imperial',
  language: 'fr',
  sensor: true
)
```

The `unit`, `language` and `sensor` parameters can be set globally or can be provided for every request if passed as parameters.

## Authentication

Gistance only supports authentication via an API key.

You can request one following these [steps](https://developers.google.com/places/documentation/#Authentication).

## Usage

```ruby
distances = Gistance.distance_matrix(
  origins: ["37.769541, -122.486747"],
  destinations: ["37.740497, -122.442887"]
)

distances.origin_addresses
# => ["Golden Gate Park"]

# etc…
```

## Features

Gistance supports all the [Google Distance Matrix parameters](https://developers.google.com/maps/documentation/distancematrix/#RequestParameters)

Complete Gistance public API's documentation [here](http://rubydoc.info/gems/gistance/frames).

## Similar libraries

- [google_distance_matrix](https://github.com/Skalar/google_distance_matrix)

## Versioning
Gistance follows the principles of [semantic versioning](http://semver.org).

1. Patch level releases contain only bug fixes.
2. Minor releases contain backward-compatible new features.
3. Major new releases contain backwards-incompatible changes to the public API.

## Contributing

Pull Requests are welcome !

Please refer to the [Contributing guide](https://github.com/sush/gistance/blob/master/CONTRIBUTING.md) for more details on how to run the test suite and to contribute.


## Copyright

Copyright © 2014 Aylic Petit

Released under the terms of the MIT licence. See the [LICENSE](https://github.com/sush/gistance/blob/master/LICENSE) file for more details.
