# Rails View Testing example repo

You probably came here from the Pragmatic Pineapple blog. If not, you can check out the post
["Why Write Rails View Tests"](https://pragmaticpineapple.com/why-write-rails-view-tests/)

The idea here is to see different ways of how we can test a Rails view template.

## Setup

```bash
$ bundle install
$ bin/rails db:setup
```

Then, you can run the RSpec test we edited in the blog post:

```bash
$ bundle exec rspec spec/views/books/index.html.erb_spec.rb
```

That's it folks.
