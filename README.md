# Scout APM Rails Demo App

This is the demo app of Scout, use it for events or demo for potential customers

## Dependencies

* Ruby 2.5.3 (If you're using RVM, you can install it with `rvm install 2.5.3`)
* Postgres

## Installation

### Clone the GitHub repo

#### Install gem dependencies

```
bundle
```

#### Create database

```
bundle exec rake db:create
```

#### Import seed data

```
psql rails_demo_development < data/rails_demo_seed_20190205.dump
```

(NOTE: `rake db:seed` works too, but takes a long time)

#### Start rails server with Scout DevTrace
```
* Start rails server with Scout DevTrace
```ruby
  SCOUT_DEV_TRACE=true rails server
```

##
