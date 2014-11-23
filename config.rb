###
# Blog settings
###

require 'extensions/sitemap.rb'

Time.zone = 'UTC'

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  # Permalink format
  blog.permalink = '{year}/{month}/{day}/{title}.html'
  # Matcher for blog source files
  blog.sources = 'posts/{year}-{month}-{day}-{title}.html'
  blog.summary_length = 250
  blog.default_extension = '.md'
  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = 'page/{num}'
end

page '/feed.xml', layout: false
page '/sitemap.xml', layout: false
page '/robots.txt', layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# Asset directory settings
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Markdown settings
set :markdown_engine, :redcarpet
set :markdown, hard_wrap: true, \
               no_intra_emphasis: true, \
               fenced_code_blocks: true, \
               gh_blockcode: true, \
               autolink: true, \
               tables: true, \
               with_toc_data: true, \
               strikethrough: true, \
               superscript: true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  activate :gzip
end

# Reload the browser automatically whenever files change
activate :livereload

# Syntax highlight settings
activate :syntax

# Generate sitemap after build
activate :sitemap_generator

# Activate Directory Indexes
activate :directory_indexes

###
# Site Settings
###

# set site URL
set :site_url, 'http://blog.example.com'
# set site title
set :site_title, 'Drops Template'
# set site description (only used for meta description for the moment)
set :site_description, 'Site Description'
# set site author name
set :site_author, 'Site Author'
# set site author profile information
set :site_author_profile, 'Lorem ipsum dolor sit amet, cu facilis indoctum interpretaris has. Ius ea quod euismod fierent, per in legere gubergren accommodare, ut labitur partiendo urbanitas duo. Tamquam inciderint at sed. Per at nibh graecis intellegebat. Probo brute ancillae sit ex, tota recusabo disputando usu et.'
# set site author profile image (should be in images_dir)
set :site_author_image, 'profile.png'
# when true, the page and site titles will be reversed (page title | site title)
set :reverse_title, true
# twitter/facebook/github/linkedin links in author page (otherwise set nil)
set :social_links,
    twitter: 'https://twitter.com',
    facebook: 'https://facebook.com',
    github: 'https://github.com/5t111111',
    linkedin: 'https://linkedin.com'
# set Google Analytics account, like "XX-12345678-9"
# set :google_analytics_account, 'XX-12345678-9'
