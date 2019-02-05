# Scout APM Rails App

This is the demo app of Scout, use it for events or demo for potential customers

## Dependencies

* RVM (for `.ruby-version` support)
  ```rvm install 2.5.3```
* Postgres

## Installation
* Clone the GitHub repo
* `bundle`
* create database
```ruby
bundle exec rake db:create db:migrate
```
* import seed data from dump file (NOTE: `rake db:seed` works, but takes too long time)
```
psql rails_demo_development < data/rails_demo_seed_20190205.dump
```
* Start rails server with Scout DevTrace
```ruby
  SCOUT_DEV_TRACE=true rails server
```

## 