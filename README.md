# Scout APM Rails Demo App

This is the demo app of Scout, use it for events or demo for potential customers

## Dependencies

* Ruby 2.6.1 (If you're using RVM, you can install it with `rvm install 2.6.1`)
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
```ruby
  SCOUT_DEV_TRACE=true rails server
```
![image](https://d2ddoduugvun08.cloudfront.net/items/0j2W063D2Q0W2C3F1s37/Screen%20Recording%202019-02-05%20at%2001.04%20PM.gif?X-CloudApp-Visitor-Id=2836786&v=f11608df)
