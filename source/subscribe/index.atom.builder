author = data.authors.author1

feed_name = "#{author[:org]}"
org_full_url = "#{author[:org_full_url]}"
author_name = "#{author[:fname]} #{author[:mname]} #{author[:lname]} #{author[:sname]}"

xml.instruct!
xml.feed 'xmlns' => 'http://www.w3.org/2005/Atom' do
  xml.title "#{feed_name}"
  xml.id "#{org_full_url}/"
  xml.link 'href' => "#{org_full_url}/"
  xml.link 'href' => "#{org_full_url}/subscribe/index.atom", 'rel' => 'self'
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "#{author_name}" }

  blog.articles.each do |article|
    xml.entry do
      xml.title article.title
      xml.link 'rel' => 'alternate', 'href' => "#{org_full_url}/#{article.url}"
      xml.id "#{org_full_url}/#{article.url}"
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "#{author_name}" }
      xml.summary article.summary, 'type' => 'html'
      xml.content article.body, 'type' => 'html'
    end
  end
end
