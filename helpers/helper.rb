def format_date(date)
  date.strftime('%B %d, %Y')
end

def site_title_logo
  data.settings.site_title_logo_image
  rescue NameError
    nil
end

def title(title)
  @page_title = title
end

def format_title
  separator = ' | '
  if data.settings.reverse_title
    if current_article
      current_article.title + separator + data.settings.site_title
    elsif @page_title
      @page_title + separator + data.settings.site_title
    else
      data.settings.site_title
    end
  else
    if current_article
      data.settings.site_title + separator + current_article.title
    elsif @page_title
      data.settings.site_title + separator + @page_title
    else
      data.settings.site_title
    end
  end
end

def page_description
  if current_article && current_article.summary(100)
    description = current_article.summary
  elsif @page_title
    description = @page_title + ' page of ' + data.settings.site_title
  else
    description = data.settings.site_description
  end
  # remove html tags
  description.gsub(/<("[^"]*"|'[^']*'|[^'">])*>/, '').gsub(/[\r\n]/, ' ')
end

def analytics_account
  google_analytics_account
  rescue NameError
    nil
end
