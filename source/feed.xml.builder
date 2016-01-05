xml.instruct!
xml.feed 'xmlns' => 'http://www.w3.org/2005/Atom' do
  xml.title data.settings.site_title
  xml.id URI.join(data.settings.site_url, blog.options.prefix.to_s)
  xml.link 'href' => URI.join(data.settings.site_url, blog.options.prefix.to_s)
  xml.link 'href' => URI.join(data.settings.site_url, current_page.path), 'rel' => 'self'
  xml.updated(blog.articles.first.date.to_time.iso8601) unless blog.articles.empty?
  xml.author { xml.name data.settings.site_author }

  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      article_url_escaped = URI.escape(article.url)
      xml.link 'rel' => 'alternate', 'href' => URI.join(data.settings.site_url, article_url_escaped)
      xml.id URI.join(data.settings.site_url, article_url_escaped)
      xml.published article.date.to_time.iso8601
      xml.updated File.mtime(article.source_file).iso8601
      # xml.author { xml.name data.settings.site_author }
      xml.summary article.summary, 'type' => 'html'
      xml.content article.body, 'type' => 'html'
    end
  end
end
