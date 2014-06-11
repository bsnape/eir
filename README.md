# Uri::Health

A really easy way to monitor the health of a list of endpoints over time.

## Installation and Usage

Install:

    $ gem install uri-health

In a new directory, create a `uris.yaml` YAML file of the URIs you wish to monitor:

    - http://www.google.co.uk : Google
    - http://www.yahoo.co.uk : Yahoo
    - http://www.itv.com : ITV

From the console, navigate to your new directory and simply run:

    $ uri-health

A lightweight Sinatra app will start at `http://localhost:8700`.

## TODO

1. Test connection error cases
2. Parse/validate URIs
3. Validate YAML
4. A pre

## Contributing

1. Fork it ( http://github.com/<my-github-username>/uri-health/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
