Time.zone = 'America/New_York'

set :index_file, 'index.html'

set :css_dir, 'css'
set :images_dir, 'img'
set :js_dir, 'js'

activate :blog do |blog|
  blog.sources = 'content/:title.html'
  blog.default_extension = '.slim'
  blog.summary_separator = /(READMORE)/

  blog.tag_template = 'articles.html'
  blog.calendar_template = 'articles.html'

  blog.permalink = ':title.html'
  blog.taglink = ':tag/index.html'

  blog.year_link = ':year/index.html'
  blog.month_link = ':year/:month/index.html'
  blog.day_link = ':year/:month/:day/index.html'

  blog.paginate = true
  blog.per_page = 3
  blog.page_link = 'page-:num'
end

activate :directory_indexes

page '/subscribe/index.atom', :layout => false

ignore '/intros/'

Slim::Engine.set_default_options(:attr_wrapper => "'", :format => :xhtml, :pretty => true, :sort_attrs => true)
::Compass.configuration.sass_options = { :line_comments => false }

#activate :livereload

configure :build do
  Slim::Engine.set_default_options(:pretty => false)
  ::Compass.configuration.sass_options = { :style => :compressed }

  activate :gzip, :exts => %w(.atom .css .html .js .rss .svg .txt .xhtml .xml)
end
