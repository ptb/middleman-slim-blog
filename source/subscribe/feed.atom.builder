author = data[:authors][:author1]
site = data[:authors][:site1]

feed_name = site[:name]
site_url = site[:url]
author_name = [author[:fname], author[:mname], author[:lname], author[:sname]].reject{|s| s.empty?}.join(' ')

xml.instruct!
xml.feed xmlns: 'http://www.w3.org/2005/Atom' do
  xml.title feed_name
  xml.id URI.join(site_url, blog.options.prefix.to_s)
  xml.link href: URI.join(site_url, blog.options.prefix.to_s)
  xml.link href: URI.join(site_url, current_page.path), rel: 'self'
  xml.author { xml.name author_name }

  unless blog.articles.empty?
    xml.updated blog.articles.first.date.to_time.iso8601

    blog.articles.each do |article|
      xml.entry do
        xml.title article.title
        xml.link href: URI.join(site_url, article.url), rel: 'alternate'
        xml.id URI.join(site_url, article.url)
        xml.published article.date.to_time.iso8601
        xml.updated File.mtime(article.source_file).iso8601
        xml.author { xml.name author_name }
        # xml.summary article.summary, type: 'html'
        xml.content article.body, type: 'html'
      end
    end
  end
end
