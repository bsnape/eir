# Uri::Health

A really easy way to monitor the health of a list of endpoints over time.

## Installation and Usage

Add to your Gemfile:

    gem 'uri-health'

Create a YAML file of the URIs you wish to monitor:

    - http://www.google.co.uk
    - http://www.yahoo.co.uk
    - http://www.itv.com
    - http://www.itv.com/news/uk/

Include the path to your YAML file when executing the code:

    Uri::Health::Status.new('spec/support/uris.yaml').go

The status codes are returned in a hash and written to `uri-health/last_run.json`:

    {
        "http://www.google.co.uk": 200,
        "http://www.yahoo.co.uk": 200,
        "http://www.itv.com": 200,
        "http://www.itv.com/news/uk/": 200
    }

## TODO

1. Introduce polling over time
2. Test connection error cases
3. Parse URIs
4. A pretty report

## Contributing

1. Fork it ( http://github.com/<my-github-username>/uri-health/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
