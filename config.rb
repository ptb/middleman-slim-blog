Time.zone = 'America/New_York'

set :css_dir, 'css' if File.directory?('source/css/')
set :images_dir, 'img' if File.directory?('source/img/')
set :js_dir, 'js' if File.directory?('source/js/')

set :partials_dir, 'partials' if File.directory?('source/partials/')

ignore 'intros/*' if File.directory?('source/intros/')

set :layout, 'minimum'
with_layout false do
  page '*.atom'
  page '*.rss'
  page '*.xml'
  page '*.css'
end

activate :blog do |blog|
  blog.sources = 'content/:title.html'
  blog.default_extension = '.slim'
  blog.summary_separator = /(READMORE)/

  blog.layout = 'blog'
  set :layout, 'blog'

  blog.permalink = ':title.html'

  blog.tag_template = 'articles.html'
  blog.taglink = ':tag/index.html'

  blog.calendar_template = nil
  blog.year_link = ':year/index.html'
  blog.month_link = ':year/:month/index.html'
  blog.day_link = ':year/:month/:day/index.html'

  blog.paginate = true
  blog.per_page = 3
  blog.page_link = 'page-:num'
end

I18n.enforce_available_locales = false
Slim::Engine.set_default_options attr_quote: "'", :format => :xhtml, pretty: true, sort_attrs: true, shortcut: {'@' => {attr: 'role'}, '#' => {attr: 'id'}, '.' => {attr: 'class'}, '%' => {attr: 'itemprop'}, '&' => {tag: 'input', attr: 'type'}}
set :sass, cache: false, line_comments: false, :style => :expanded

activate :directory_indexes
# set :index_file, 'index.html'

# set :relative_links, true
# activate :relative_assets

activate :asset_hash

# activate :livereload, :host => '0.0.0.0'

configure :build do
  Slim::Engine.set_default_options pretty: false

  set :sass, :style => :compressed
  # activate :minify_css
  # compass_config do |config|
    # config.output_style = :compressed
  # end

  # activate :minify_javascript

  activate :minify_html, remove_quotes: false
  activate :gzip, exts: %w(.atom .css .html .js .rss .svg .txt .xhtml .xml .eot .otf .ttf)
end
