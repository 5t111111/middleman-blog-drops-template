require 'sitemap_generator'

module GoogleSitemapGenerator
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
    alias_method :included, :registered
  end
end

::Middleman::Extensions.register(:sitemap_generator, GoogleSitemapGenerator)
