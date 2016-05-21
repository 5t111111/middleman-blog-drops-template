xml.instruct!
xml.urlset 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  sitemap.resources.each do |resource|
    next unless resource.destination_path =~ /\.html\Z/
    next if resource.destination_path =~ /404\.html\Z/
    xml.url do
      xml.loc URI.join(data.settings.site_url, resource.url)
      xml.priority 0.5
    end
  end
end
