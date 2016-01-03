# Drops (middleman-blog-drops-template)

Drops is a Middleman blog template.

__NOTE: This branch is still WIP and the document is not up-to-date, but you can try it now.__

``` text
$ middleman init -T 5t111111/middleman-blog-drops-template#upgrade-to-v4 my-blog
$ cd my-blog
$ npm install
```

## Screenshot

![screenshot.jpg](https://raw.githubusercontent.com/wiki/5t111111/middleman-blog-drops-template/images/screenshot.jpg)

## Features

- Lovely darkish water drop mascot
- Automatically generate the sitemap and the Atom feed
- Responsive layout with [Breakpoint](http://breakpoint-sass.com/)
- Syntax highlighting with [middleman-syntax](https://github.com/middleman/middleman-syntax) (using [rouge](https://github.com/jneen/rouge))
- [npm](https://www.npmjs.com/) for assets management
- No Nokogiri dependency (by using custom middleman-blog with [Oga](https://github.com/YorickPeterse/oga))
- GitHub Pages deployment ready
- S3 deployment ready
- (**deprecated**) Heroku deployment ready (You can also add New Relic addon out of the box)

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

### Install gems and npm packages

```console
$ cd my_blog_project
$ bundle install
$ npm install
```

Note: For the moment npm is used only for installing [Font Awesome](https://fortawesome.github.io/Font-Awesome/), so in the case if you don't want to install Node, you can manually download Font Awesome and place it in `node_modules` directory like the followings.

``` text
# After downloading Font Awesome and unzip an archive
$ mkdir node_modules
$ mv /path/to/font-awesome-x.x.x node_modules/font-awesome
```

### Start Middleman server

```console
$ bundle exec middleman
```

Then open `http://localhost:4567` in a web browser.

### Write article

Now you are ready to write your own articles. Create markdown file (.md) in `source/posts` and start writing. See exmaple article file `2015-11-20-this-is-an-example-article.html.md` for details.

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

## GitHub Pages deployment

### Creating a GitHub repository

When you would like to deploy a blog to GitHb Pages, at first you have to create a new repository named "{username}.github.io". The repository name should be "5t111111.github.io" when your GitHub account name is "5t111111".

### Setting remote "origin"

Once the repository is created, set it to origin of your blog respository.

```text
$ git remote add origin git@github.com:5t111111/5t111111.github.io.git
```

### Deployment

By just running the following command, static pages are automatically built and deployed to the repository you created.

```text
$ bundle exec middleman deploy
```

### Accessing to your blog page

You can visit your blog page as the reposiory name. http://5t111111.github.io when the repository you have created is "5t111111.github.io".

## S3 deployment

You can host your blog on AWS S3 via **S3 Static Website Hosting**.

### Creating an S3 bucket

Go to S3 in AWS management console, and create a bucket for your blog hosting.

### Configuraion for Static Website Hosting

Open **Properties** of the bucket you just created, and make changes to **Static Website Hosting** section like the followings.

- Select **Enable website Hosting**
- **Index Document:** index.html
- **Error Document:** 404/index.html

### S3 configuration

Modify S3 configuration in `config.rb` for your AWS S3 settings. At least you have to change the followings.

```ruby
# Activate S3Sync
activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'my.bucket.com' # The name of the S3 bucket you are targetting. This is globally unique.
  s3_sync.region                     = 'us-west-1'     # The AWS region for your bucket.
  ...
end
```

You also have to set AWS credentials to access to a bucket by setting environment variables.

```text
$ export AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY
$ export AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY
```

### Deployment

It's time to deploy your blog to S3. At first you manually have to build static pages, and then sync them to an S3 bucket.

```text
$ bundle exec middleman build
$ bundle exec middleman s3_sync
```

### Accessing to your blog page

The URL for your blog page is shown as **Endpoint** in **Static Website Hosting** of a bucket properties. Just enter it in a web browser and check if you can visit your page.

## Heroku deployment

**This is a deprecated feature because of Heroku's changes to their pricing. Although this feature is still available out of the box, it may be removed in a future release.**

Since Drops provides the configuration of Rack appliction for static file serving, in almost all cases you don't need to setup any server configuration at all.

Edit your Gemfile to specify Ruby version you want to use.

```ruby
source 'https://rubygems.org'

ruby '2.2.3'

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

See `config.ru`, `Procfile` and `.buildpacks` for details.

## License

Drops (except the images) is licensed under MIT license.
The built-in images provided in `source/images` are restricted to use only within this template, so you cannot use outside of this template or re-distribute them.
See `LICENSE.md` for details.

