def format_date(date)
  date.strftime('%B %d, %Y')
end

def site_title_logo
  site_title_logo_image
  rescue NameError
    nil
end

def title(title)
  @page_title = title
end

def format_title
  separator = ' | '
  if reverse_title
    if current_article
      current_article.title + separator + site_title
    elsif @page_title
      @page_title + separator + site_title
    else
      site_title
    end
  else
    if current_article
      site_title + separator + current_article.title
    elsif @page_title
      site_title + separator + @page_title
    else
      site_title
    end
  end
end

def page_description
  if current_article && current_article.summary(100)
    description = current_article.summary
  elsif @page_title
    description = @page_title + ' page of ' + site_title
  else
    description = site_description
  end
  # remove html tags
  description.gsub(/<("[^"]*"|'[^']*'|[^'">])*>/, '').gsub(/[\r\n]/, ' ')
end

def analytics_account
  google_analytics_account
  rescue NameError
    nil
end
