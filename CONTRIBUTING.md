# Contributing

## Running the test suite

	bundle exec rake spec

### Code quality

Code quality is checked with [cane](https://github.com/square/cane) configured in `Rakefile`.

Build fails if code quality thresholds **are not met**.

### Code coverage

When running the test suite a test coverage report is generated with [SimpleCov](https://github.com/colszowka/simplecov) in `coverage/index.html`.

Build fails if coverage is below **99%**.

## Writing new tests
Gistance uses [VCR](https://github.com/vcr/vcr) for recording and playing back API fixtures (in `spec/cassettes`) during test runs.

## Documentation

Documentation is generated with [YARD](http://yardoc.org/).

## Workflow

1. Fork [Gistance](https://github.com/sush/gistance)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
