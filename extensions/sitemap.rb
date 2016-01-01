require 'sitemap_generator'

class GoogleSitemapGenerator < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  class << self
    def registered(app)
      app.after_build do |_builder|
        app_sitemap = sitemap # avoid name conflict
        SitemapGenerator::Sitemap.default_host = site_url
        SitemapGenerator::Sitemap.create(:public_path => 'build', :verbose => true) do
          app_sitemap.resources.each do |r|
            add(r.url) if r.ext == '.html'
          end
        end
      end
    end
    alias :included :registered
  end
end

::Middleman::Extensions.register(:sitemap_generator, GoogleSitemapGenerator)
