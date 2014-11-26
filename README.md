# Drops (middleman-blog-drops-template)

Drops is a Middleman blog template.

## Screenshot

![screenshot.jpg](https://raw.githubusercontent.com/wiki/5t111111/middleman-blog-drops-template/images/screenshot.jpg)

## Features

- Lovely darkish water drop mascot
- Heroku deployment ready (You can also add New Relic addon out of the box)
- Automatically generate the sitemap and the Atom feed
- Responsive layout with [Breakpoint](http://breakpoint-sass.com/)
- Syntax highlighting with [middleman-syntax](https://github.com/middleman/middleman-syntax) (using [rouge](https://github.com/jneen/rouge))
- [Rails Assets](https://rails-assets.org) for assets management (No longer required to install Bower)
- No Nokogiri dependency (by using custom middleman-blog with [Oga](https://github.com/YorickPeterse/oga))

## Installation

Install Middleman if you haven't done yet.

```console
$ gem install middleman
```

### Clone this template to your machine

```console
$ mkdir ~/.middleman # if it doesn't exist
$ cd ~/.middleman
$ git clone https://github.com/5t111111/middleman-blog-drops-template.git blog-drops
```

### Create middleman blog project

```console
$ middleman init my_blog_project --template=blog-drops
```

### Install gems

```console
$ cd my_blog_project
$ bundle install
```

### Start Middleman server

```console
$ bundle exec middleman
```

Then open `http://localhost:4567` in a web browser.

### Write article

Now you are ready to write your own articles. Create markdown file (.md) in `source/posts` and start writing. See exmaple article file `2014-11-20-this-is-an-example-article.html.md` for details.

## Configuration

Edit at least the following settings in the bottom section of `config.rb`.

| name                        | description                                                                             |
|:---------------------------:|:---------------------------------------------------------------------------------------:|
| :site_url                   | your blog URL                                                                           |
| :site_title                 | your blog title                                                                         |
| :site_description           | your blog description (only used for meta description for the moment)                   |
| :site_author                | author name                                                                             |
| :site_author_profile        | author profile information                                                              |
| :site_author_image          | author profile image                                                                    |
| :reverse_title              | when true, the page and site titles will be reversed (page title | site title)          |
| :social_links               | social link buttons in author page                                                      |
| :google_analytics_account   | Google Analytics account (optional)                                                     |

## Heroku deployment

Since Drops provides the configuration of Rack appliction for static file serving, in almost all cases you don't need to setup any server configuration at all. 

Edit your Gemfile to specify Ruby version you want to use.

```ruby
source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.5'

# middleman
gem 'middleman', '~> 3.3.5'

...
```

Now commit all changes and create Heroku app.

```text
$ heroku create
```

Push it to Heroku.

```text
$ git push heroku master
```

Open it in a web browser.

```text
$ heroku open
```

See `config.ru` and `Procfile` for details.

## License

Drops (except the images) is licensed under MIT license.
The built-in images provided in `source/images` are restricted to use only within this template, so you cannot use outside of this template or re-distribute them.
See `LICENSE.md` for details.

