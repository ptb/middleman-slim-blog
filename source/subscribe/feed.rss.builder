site = data[:authors][:site1]

feed_name = site[:name]
site_url = site[:url]
description = site[:description]

xml.instruct!
xml.rss version: '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.title feed_name
    xml.link URI.join(site_url, blog.options.prefix.to_s)
    xml.description description
    xml.atom :link, href: URI.join(site_url, current_page.path), rel: 'self', type: 'application/rss+xml'

    unless blog.articles.empty?
      xml.pubDate blog.articles.first.date.to_time.rfc2822

      blog.articles.each do |article|
        xml.item do
          xml.title article.title
          xml.link URI.join(site_url, article.url)
          xml.guid URI.join(site_url, article.url)
          xml.pubDate article.date.to_time.rfc2822
          xml.description article.body
        end
      end
    end
  end
end
