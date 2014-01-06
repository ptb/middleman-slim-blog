site_url = data[:authors][:site1][:url]

xml.instruct!
xml.urlset xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9' do

  unless blog.articles.empty?
    xml.url do
      xml.loc URI.join(site_url, blog.options.prefix.to_s)
      unless blog.articles.empty?
        xml.lastmod blog.articles.first.date.to_time.iso8601
      end
    end

    blog.articles.each do |article|
      xml.url do
        xml.loc URI.join(site_url, article.url)
        xml.lastmod article.date.to_time.iso8601
      end
    end
  end

  unless blog.tags.empty?
    blog.tags.each do |tag, articles|
      xml.url do
        xml.loc URI.join(site_url, tag_path(tag))
        xml.lastmod articles.first.date.to_time.iso8601
      end
    end
  end

  if blog.articles.empty?
    sitemap.resources.each do |page|
      if (page.ext.match(/html/))
        if (page.metadata[:locals]['page_type'])
          if (page.metadata[:locals]['page_type'].match(/tag/))
            xml.url { xml.loc URI.join(site_url, page.url) }
          end
        else
          xml.url { xml.loc URI.join(site_url, page.url) }
        end
      end
    end
  end

end
