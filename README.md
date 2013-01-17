[![Build Status](https://travis-ci.org/jakeonrails/timestamp_scopes.png)](https://travis-ci.org/jakeonrails/timestamp_scopes) • [![Gem Version](https://badge.fury.io/rb/timestamp_scopes.png)](http://badge.fury.io/rb/timestamp_scopes)

# timestamp_scopes

Dynamically add useful timestamp scopes to your ActiveRecord models!

It's not hard to write queries to scope your models by their timestamps, like this:

```ruby
  Post.where('created_at > ?', 1.hour.ago)
```

But I thought it would be nice if there were a nicer, easier to read syntax for doing it:

```ruby
  Post.created(after: 1.hour.ago)
  
  # or:
  
  Post.updated(before: 1.day.ago)
```

Read on if this sounds like something you want in your project!

## Installation

Add this line to your application's Gemfile:

    gem 'timestamp_scopes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install timestamp_scopes

## Usage

In any of your ActiveRecord models, you need to call the `add_timestamp_scopes` macro, like this:

```ruby
class Post < ActiveRecord::Base
  add_timestamp_scopes

```

And now you will have the `created` and `updated` timestamp scopes.

### Other timestamp columns

You can pass a list of scope names to the `add_timestamp_scopes` method:

```ruby
class Post < ActiveRecord::Base
  add_timestamp_scopes :created, :updated, :posted, :approved

```

And now your `Post` model will have the `.posted` and `.approved` scopes, referring to the `posted_at` and `approved_at` columns, respectively.

## Scope Syntax

Once you have a scope in your model, you can combine several timestamp constraints on that scope.

Currently the constraints available are `:before` and `:after`.

```ruby
Post.created(after: 1.day.ago) == Post.where('created_at > ?', 1.day.ago)

Post.created(before: 1.day.ago) == Post.where('created_at < ?', 1.day.ago)
```

## Future Scope Syntaxes

Some scope syntaxes that might be added in a future release are:

```ruby
Post.created(between: 2.days.ago, and: 1.day.ago)

Post.created(on: 1.day.ago)

Post.created(:yesterday)

Post.created(:last_week)

Post.created(:last_month)
```

Please [submit an issue](https://github.com/jakeonrails/timestamp_scopes/issues/new) if you think of a cool new syntax that you think timestamp_scopes should support.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author(s)

timestamp_scopes is written and maintained by Jake Moffatt ([@jakeonrails](http://twitter.com/jakeonrails))
