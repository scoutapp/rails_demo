# Scout APM Rails Demo App

This is the demo app of Scout, use it for events or demo for potential customers

## Dependencies

* Ruby 2.5.3 (If you're using RVM, you can install it with `rvm install 2.5.3`)
* Postgres
* Redis

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

# [TOKYO RUBYIST MEETUP 2019-02-06](https://trbmeetup.doorkeeper.jp/events/85868) Pair Programming session

### Migrating to fast_jsonapi

As mentioned in the presentation, fast_jsonapi is a high performance JSON::API serializer. Let's try migrating to it.

The [fast_jsonapi documentation](https://github.com/Netflix/fast_jsonapi) provides a good overview of how to use it.

For this task, you'll replace the jbuilder user views (app/views/users/index.json.jbuilder and app/views/users/show.json.jbuilder) with a fast_jsonapi UserSerializer.

You can access this in your browser by visiting http://localhost:3000/users.json and http://localhost:3000/users/1.json for instance.

Scout also can give you a performance overview in development mode! However, as it only works with html responses, you'll need to visit the html views instead (http://localhost:3000/users and http://localhost:3000/users/1).

You'll be able to see the performance tab by clicking the panel in the bottom left corner:

![image](https://d2ddoduugvun08.cloudfront.net/items/0j2W063D2Q0W2C3F1s37/Screen%20Recording%202019-02-05%20at%2001.04%20PM.gif?X-CloudApp-Visitor-Id=2836786&v=f11608df)

Once you've migrated the application to use fast_jsonapi, you can compare the performance:

    rails runner "require 'performance_test'; PerformanceTest.run"

Now's a great chance to talk with your partner about the two approaches. What do you think of the difference in strategies? Do you prefer the more object oriented approach of fast_jsonapi or the declarative approach of jbuilder? What do you think of JSON::API vs the json that jbuilder produces?

## Find additional performance issues

We've deployed this application, sent some sample requests to it, and created a shared Scout account you can use.  Login from [https://scoutapp.com/users/sign_in](https://scoutapp.com/users/sign_in) with the credentials:

    - username: rails_demo@scoutapp.com
    - password: password

Browse through the results there, and then dive into any other performance issues you can identify.
